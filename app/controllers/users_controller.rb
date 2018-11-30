class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
    @hosted_bookings = Array.new
    @user.flats.each do |f|
      f.bookings.each do |b|
        @hosted_bookings << b
      end
    end
  end

end
