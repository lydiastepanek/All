class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :user_id, :status, presence: true
  validates :status, inclusion: ["PENDING","APPROVED","DENIED"]
  validate :is_not_overlapping?
  after_initialize :status_set
  belongs_to(
    :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id
  )

  belongs_to(
    :requestor,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )


  def approve!
    raise "not pending" unless self.status == "PENDING"
    transaction do
      self.status = "APPROVED"
      self.save

      overlapping_pending_requests.update_all(status: "DENIED")
    end

  end


  def approved?
    self.status == "APPROVED"
  end

  def denied?
    self.status == "DENIED"
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where("NOT (? > end_date OR start_date > ?)", start_date, end_date)
      .where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def is_not_overlapping?
    unless overlapping_approved_requests.empty?
      errors[:base] << "Can't add a rental that conflicts with another rental"
    end
  end

  def status_set
    self.status ||= "PENDING"
  end

end
