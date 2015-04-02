class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many(
    :authored_polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )

  def completed_polls
    # Poll.find_by_sql([<<-SQL, self.id])
    # SELECT
    #   p.*, COUNT(DISTINCT q.id) AS qids, COUNT(r.id) AS rids
    # FROM
    #   polls AS p
    # LEFT OUTER JOIN
    #   questions AS q ON q.poll_id = p.id
    # LEFT OUTER JOIN
    #   answer_choices AS ac ON ac.question_id = q.id
    # LEFT OUTER JOIN
    #   responses AS r ON r.answer_choice_id = ac.id
    # WHERE
    #   r.user_id = ?
    # GROUP BY
    #   p.id
    # HAVING
    #   COUNT(DISTINCT q.id) = COUNT(r.id)
    # SQL

    Poll.select('polls.*')
      .joins('LEFT OUTER JOIN questions AS q ON q.poll_id = polls.id')
      .joins('LEFT OUTER JOIN answer_choices AS ac ON ac.question_id = q.id')
      .joins('LEFT OUTER JOIN responses AS r ON r.answer_choice_id = ac.id')
      .where('r.user_id = ?', self.id)
      .group('polls.id')
      .having('COUNT(DISTINCT q.id) = COUNT(r.id)')
  end

  def uncompleted_polls

    Poll.select('polls.*')
      .joins('LEFT OUTER JOIN questions AS q ON q.poll_id = polls.id')
      .joins('LEFT OUTER JOIN answer_choices AS ac ON ac.question_id = q.id')
      .joins('LEFT OUTER JOIN responses AS r ON r.answer_choice_id = ac.id')
      .where('r.user_id = ?', self.id)
      .group('polls.id')
      .having('COUNT(DISTINCT q.id) != COUNT(r.id)')
  end
end
