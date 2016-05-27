class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.new (user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def show
    @user = User.find(params[:id])
    @UT = Trip.where(user_id: @user.id )
    @likes = Like.where(user_id: current_user.id).count
    @places = Trip.where(user_id: @user.id)

  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :back
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def about
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
end