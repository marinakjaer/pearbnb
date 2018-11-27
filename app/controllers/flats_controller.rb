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
    @address = params[:location]
    @restaurants = RESTAURANTS.select { |id, r| r[:category] == @category }

  end

  def flat_params
    params.require(:flat).permit(:description, :address, :max_guest, :price_per_night)
  end
end
