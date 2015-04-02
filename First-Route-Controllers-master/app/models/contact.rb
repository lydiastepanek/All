class Contact < ActiveRecord::Base

  validates :user_id, presence: true
  validates :email, presence: true,  :uniqueness => {:scope => :user_id}
  validates :name, presence: true


  belongs_to(
  :owner,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(
  :shares,
  :dependent => :destroy,
  class_name: "ContactShare",
  foreign_key: :contact_id,
  primary_key: :id
  )

end
