class LikesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @like = Like.new(user_id: current_user.id, likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
    if @like.save
      redirect_to :back
    else
      flash[:errors] = ["Unable to like this object."]
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
    if @like.destroy
      redirect_to :back
    else
      flash[:errors] = ["Unable to unlike this object."]
      redirect_to :back
    end
  end
end
