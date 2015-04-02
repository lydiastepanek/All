class Question < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :text, presence: true

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def add_answer_choice(text)
    AnswerChoice.create(question_id: self.id, text: text)
  end

  def respond_to(user, answer_choice)
    Response.create(
      answer_choice_id: answer_choice.id,
      user_id: user.id
    )
  end

  def results
    # answer_choices = self.answer_choices.includes(:responses)
    #
    # results = {}
    # answer_choices.each do |answer_choice|
    #   results[answer_choice.text] = answer_choice.responses.length
    # end
    #
    # results
    #
    # AnswerChoice.find_by_sql([<<-SQL, self.id])
    # SELECT
    #   answer_choices.*, COUNT(responses.id) AS response_count
    # FROM
    #   answer_choices
    # LEFT OUTER JOIN
    #   responses ON answer_choices.id = responses.answer_choice_id
    # WHERE
    #   answer_choices.question_id = ?
    # GROUP BY
    #   answer_choices.id
    # SQL
    #
    self.answer_choices
      .select('answer_choices.*, COUNT(responses.id) AS response_count')
      .joins('LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id')
      .where('answer_choices.question_id = ?', self.id)
      .group('answer_choices.id')
  end
end
