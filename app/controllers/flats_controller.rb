class FlatsController < ApplicationController
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
  end

  def destroy
  end

  def results
    @city = params[:city]
    @max_guests = params[:guests]

    # Need to later to the bookings vs this
    @check_in = params[:arrival]
    @check_out = params[:departure]
    @flats = Flat.select { |f| f.city == @city && f.max_guests >= @max_guests}

  end

  def flat_params
    params.require(:flat).permit(:description, :address, :max_guest, :price_per_night)
  end
end
