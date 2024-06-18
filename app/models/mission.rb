class Mission < ApplicationRecord
  validates :date, presence: true
  # validates :status, inclusion: { in: %w[first_checkin last_checkout checkout_checkin] }
  validates :price, numericality: { only_integer: true }, inclusion: { in: [5, 10, 20] }

  belongs_to :listing
end
