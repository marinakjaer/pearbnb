class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:results, :show]

  def index

  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      @flat.user.host = true
      redirect_to new_flat_booking_path(@flat)
    else
      render:new
    end
    raise
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def show
  end

  def update
    @flat.update(flat_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to new_flat_booking_path(@flat)
  end

  def destroy
    @flat.destroy

    redirect_to root_path
  end

  def results
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    @city = params[:city]
    @max_guest = params[:guests]
    # Need to later to the bookings vs this
    @check_in = params[:arrival]
    @check_out = params[:departure]

    @flats = @flats.where(city: @city) unless @city == "" || @city == nil
    @flats = @flats.where("max_guest > #{@max_guest}") unless @max_guest == "" || @max_guest == nil

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :name, :address, :max_guest, :price_per_night, :city, photos: [])
  end
end
