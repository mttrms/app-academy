class CatRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)

  belongs_to :cat
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
