class Response < ActiveRecord::Base
  validates :answer_choice_id, presence: true
  validates :user_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_poll_creator

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    # self
    # .question
    # .responses
    # .where('responses.id != ? OR ? is null', self.id, self.id)

    Response.select('responses.*')
      .joins('JOIN answer_choices ON answer_choices.id = responses.answer_choice_id')
      .joins('JOIN questions ON answer_choices.question_id = questions.id')
      .joins('JOIN answer_choices ac2 ON ac2.question_id = questions.id')
      .where('ac2.id = ?', self.answer_choice_id)
      .where('responses.id != :id OR :id is null', id: self.id)
      # .joins('JOIN responses on responses.answer_choice_id = ac2.id')
      # .joins('JOIN answer_choices ac2 ON ac2.question_id = questions.id')
      # .joins(:question)
      # .where('answer_choices.id = ?',self.answer_choice_id)
      # .where('responses.id != ? OR ? is null', self.id, self.id)
  end

  def respondent_has_not_already_answered_question
    total_responses = sibling_responses
      .where('responses.user_id = ?', self.user_id)
      .count

    if total_responses > 0
      errors[:user_id] << "can't already have responded to the question"
    end
  end

  def respondent_is_not_poll_creator
    # if self.question.poll.author == self.respondent
    #   errors[:user_id] << "poll author can't respond to question"
    # end
    count = Poll.joins(:questions)
      .joins('JOIN answer_choices ON answer_choices.question_id = questions.id')
      .where('answer_choices.id = ?', self.answer_choice_id)
      .where('polls.author_id = ?', self.user_id).count
    if count > 0
      errors[:user_id] << "poll author can't respond to question"
    end
  end
end
