class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
<<<<<<< HEAD
    
=======
    # fail
>>>>>>> e6789f7b6b7faf25af0309b282ac8361051f5058
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
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
