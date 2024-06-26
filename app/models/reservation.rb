class Reservation < ApplicationRecord
  belongs_to :listing

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validates :status, inclusion: { in: %w[pending confirmed cancelled] }

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
