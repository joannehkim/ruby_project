class PlacesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to :back
    else
      flash[:errors] = @place.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @place = Place.find(params[:id])
    @picture = Picture.new
    @pictures = Picture.where(place_id: params[:id])
  end

  def edit
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(trip_params)
      redirect_to "/place/#{@place.id}"
    else
      flash[:errors] = @trip.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  end

private
  def place_params
  params.require(:place).permit(:location, :trip_id, :description, :datetime)
  end
end
