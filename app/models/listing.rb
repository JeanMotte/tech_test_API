class Listing < ApplicationRecord

  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
