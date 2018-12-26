class BookingsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog
    authorize @booking
    if @booking.save
      redirect_to dog_booking_path(@dog, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end

