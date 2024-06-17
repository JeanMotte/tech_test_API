class BookingsController < ApplicationController
  before_action :set_listing
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = @listing.bookings
    render json: @bookings
  end

  def show
    render json: @booking
  end

  def create
    @booking = @listing.bookings.new(booking_params)
    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_booking
    @booking = @listing.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
