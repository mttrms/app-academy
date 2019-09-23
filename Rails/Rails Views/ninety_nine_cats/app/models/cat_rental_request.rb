class CatRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)

  belongs_to :cat
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :does_not_overlap_approved_request

  def overlapping_requests
    CatRentalRequest
      .where.not('(start_date > :start AND end_date > :start) OR (start_date < :end AND end_date < :end)', start: start_date, end: end_date)
      .where(cat_id: cat_id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.any?
      errors[:base] << "overlaps an approved rental request"
    end
  end
end