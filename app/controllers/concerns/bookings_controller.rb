class BookingsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:show, :new, :create] 
  def show
  	@booking = Booking.find(params[:id])
  end

  def new
   @booking = Booking.new
  end

  def create
    @booking = Booking.create(dog_params)
    redirect_to dog_booking_path
  end
end
