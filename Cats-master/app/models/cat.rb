class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :user_id, :sex, presence: true

  validates :sex, inclusion: ["M","F"]
  validates :color, inclusion: ["White","Brown","Green"]

  COLORS = ["Green", "White", "Brown"]
  SEX = ["M", "F"]

  has_many(
    :cat_rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id,
    :dependent => :destroy
  )

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  def age
    current = Date.current()
    (current - birth_date).to_i / 365
  end

end
