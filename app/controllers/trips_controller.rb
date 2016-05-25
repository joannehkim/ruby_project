class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @trip_at = Trip.where(destination: params[:id])
  end

  def to_destination
    @trip_to = Trip.where(destination: params[:id])
    @trip_owner = User.where(id: @trip_to.first.user_id)
  end

  def new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:errors] = @trip.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @places = Place.where(trip_id: @trip.id)
  end

  def edit
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:errors] = @trip.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = @trip.errors.full_messages
      redirect_to :back
    end
  end
  private
    def trip_params
      params.require(:trip).permit(:destination, :start_date, :end_date, :user_id, :description)
    end
end


