class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:results, :show]

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

    redirect_to root_path
  end

  def results
    @flats = Flat.all
    @city = params[:city]
    @max_guest = params[:guests]
    # Need to later to the bookings vs this
    @check_in = params[:arrival]
    @check_out = params[:departure]

    @flats = @flats.where(city: @city) unless @city == ""
    @flats = @flats.where("max_guest > #{@max_guest}") unless @max_guest == ""

  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :name, :address, :max_guest, :price_per_night, :city, photos: [])
  end
end
