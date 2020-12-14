class RidesController < ApplicationController
  
  def create
    ride = Ride.find_by(id: params[:ride_id])
    message = ride.take_ride
    redirect_to ride.user, flash: { message: message }
  end

end