class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
    render json: { listings: @listings}
  end

  def show
    render json: { listing: @listing }
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: { listing: @listing }
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors.details, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    head :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
