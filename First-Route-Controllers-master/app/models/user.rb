class User < ActiveRecord::Base

  ##SUCCESS
  has_many(
  :contacts,
  :dependent => :destroy,
  class_name: "Contact",
  foreign_key: :user_id,
  primary_key: :id
  )

  #SUCCESS
  has_many(
  :shared_contacts,
  :dependent => :destroy,
  through: :contacts,
  source: :shares
  )

  # SUCCESS
  has_many(
  :contact_shares,
  :dependent => :destroy,
  class_name: "ContactShare",
  foreign_key: :user_id,
  primary_key: :id
  )

end
