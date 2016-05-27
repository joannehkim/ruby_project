class PlacesController < ApplicationController
  def index
  end

  def new
  end

  def create
    # @place = Place.new(location: place_params[:location], trip_id: params[:id], description: place_params[:description], datetime: place_params[:datetime])
    # @place.trip_id = params[:id]
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
    @user_id = Trip.find_by(id: @place.trip_id).user_id
    @user = User.find(@user_id)
    @picture = Picture.new
    @pictures = Picture.where(place_id: params[:id])
    @costs = Cost.where(place_id: params[:id])
    @total_cost = @costs.sum(:cost)
    @comments = Comment.where(commentable_type: "Place", commentable_id: @place.id)
    @place_like = Like.find_by(user_id: current_user.id, likeable_id: @place.id, likeable_type: "Place")
    

  end

  def edit
    @place = Place.find(params[:id])
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
    @place = Place.find(params[:id])
    if @place.destroy(trip_params)
      redirect_to "/place/#{@place.id}"
    else
      flash[:errors] = @place.errors.full_messages
      redirect_to :back
    end
  end

private
  def place_params
  params.require(:place).permit(:location, :trip_id, :description, :datetime)
  end
end
