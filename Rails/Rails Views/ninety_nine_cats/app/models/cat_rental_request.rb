class CatRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)

  belongs_to :cat
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :does_not_overlap_approved_request, unless: -> { status == 'DENIED' }

  def overlapping_requests
    CatRentalRequest
      .where.not('start_date > :end_date OR end_date < :start_date', start_date: start_date, end_date: end_date)
      .where.not(id: id)
      .where(cat_id: cat_id)
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.any?
      errors[:base] << "overlaps an approved rental request"
    end
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = 'APPROVED'
      self.save!
      
      overlapping_pending_requests.each do |request|
        request.status = 'DENIED'
        request.save!
      end
    end
  end

  def deny!
    update(status: 'DENIED')
  end

  def pending?
    self.status == 'PENDING'
  end
end