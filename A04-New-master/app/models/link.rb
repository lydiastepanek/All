class Link < ActiveRecord::Base
  validates :title, :url, presence: true

  has_many(
  :comments,
  class_name: "Comment",
  foreign_key: :link_id,
  primary_key: :id
  )




end
