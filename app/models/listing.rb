class Listing < ApplicationRecord

  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :missions, dependent: :destroy

  validates :num_rooms, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
