class PlacesController < ApplicationController
  def index
  end

  def new
  end

  def create
    Place.create(place_params)
    redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def place_params
  params.require(:place).permit(:location, :trip_id, :description, :datetime)
  end
end
