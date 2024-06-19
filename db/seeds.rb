puts "deleting existing data"
Mission.delete_all
Booking.delete_all
Reservation.delete_all
Listing.delete_all
puts "data deleted"


puts "creating listings"
Listing.create!(num_rooms: 2)
Listing.create!(num_rooms: 1)
Listing.create!(num_rooms: 3)
puts "listings created"

puts "creating bookings"
Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date, status: "confirmed")
Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date, status: "confirmed")
Booking.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-20".to_date, status: "confirmed")
puts "bookings created"

puts "creating reservations"
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-11".to_date, end_date: "2016-10-13".to_date, status: "confirmed")
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-13".to_date, end_date: "2016-10-15".to_date, status: "confirmed")
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date, status: "confirmed")
Reservation.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-18".to_date, status: "confirmed")
puts "reservations created"
