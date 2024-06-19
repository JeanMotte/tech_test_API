class Booking < ApplicationRecord
  belongs_to :listing

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validates :status, inclusion: { in: %w[pending confirmed cancelled] }

  before_destroy :cancel_reservations
  after_update :cancel_reservations_if_cancelled
  after_create :create_missions

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  # def cancel_reservations
  #   Reservation.where(listing_id: listing_id)
  #     .where("start_date < ? AND end_date > ?", end_date, start_date)
  #     .update_all(status: 'cancelled')
  # end

  def cancel_reservations_if_cancelled
    # return unless status == 'cancelled'

    Reservation.where(listing_id: listing_id)
      .where("start_date >= ? AND end_date <= ?", start_date, end_date)
      .delete_all
  end

  def create_missions
    listing.bookings.each do |booking|
      listing.missions.create!(listing: listing, mission_type: 'first_checkin', price: 10 * listing.num_rooms, date: booking.start_date)
      last_checkout = listing.missions.create!(listing: listing, mission_type: 'last_checkout', price: 5 * listing.num_rooms, date: booking.end_date)
      listing.reservations.each do |reservation|
        checkin_checkout = listing.missions.create!(listing: listing, mission_type: 'checkout_checkin', price: 10 * listing.num_rooms, date: reservation.end_date) unless last_checkout.date == checkin_checkout.date
      end
    end
  end

end
