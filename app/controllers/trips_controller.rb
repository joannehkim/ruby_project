class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:errors] = @trip.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @trip = Trip.find(params[:id])
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
