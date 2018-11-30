class BookingsController < ApplicationController
  def create
    @flat = set_flat
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.status = false
    if @booking.save
      redirect_to profile_path(current_user)
    else
      render:new
    end
  end

  def new
    @flat = set_flat
    @booking = Booking.new
  end

  def destroy
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    respond_to do |format|
       # format.html {redirect_to profile_path(@booking.flat.user)}
      format.js
    end
  end

  private
  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :user, :flat, :check_out)
  end


end
