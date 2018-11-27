class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render:new
    end
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def show
  end

  def update
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render:edit
    end
  end

  def destroy
    @flat.destroy
  end

  def results
    @city = params[:city]
    @max_guests = params[:guests]

    # Need to later to the bookings vs this
    @check_in = params[:arrival]
    @check_out = params[:departure]
    @flats = Flat.select { |f| f.city == @city && f.max_guests >= @max_guests}

  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :address, :max_guest, :price_per_night)
  end
end
