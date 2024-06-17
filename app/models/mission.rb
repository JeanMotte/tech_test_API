class Mission < ApplicationRecord
  validates :date, presence: true
  validates :status, inclusion: { in: %w[first_checkin last_checkout checkout_checkin] }

  belongs_to :listing

end
