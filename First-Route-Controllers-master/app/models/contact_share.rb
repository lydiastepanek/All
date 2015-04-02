class ContactShare < ActiveRecord::Base

  validates :contact_id, presence: true
  validates :user_id, presence: true,  :uniqueness => {:scope => :user_id}

  belongs_to(
   :shared_user,
   class_name: "User",
   foreign_key: :user_id,
   primary_key: :id
  )

  belongs_to(
  :shared_contacts,
  class_name: "Contact",
  foreign_key: :contact_id,
  primary_key: :id
  )

end
