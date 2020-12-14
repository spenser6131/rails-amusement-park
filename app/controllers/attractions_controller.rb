class AttractionsController < ApplicationController

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @ride.user = User.find_by(id: current_user.id)
    @ride.attraction = Attraction.find_by(id: @attraction.id)
    @ride.save
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end