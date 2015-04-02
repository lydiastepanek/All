class Comment < ActiveRecord::Base
  validates :link_id, :comment, presence: true

  belongs_to(
  :link,
  class_name: "Link",
  foreign_key: :link_id,
  primary_key: :id
  )




end
