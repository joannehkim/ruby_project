class PicturesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to :back
    else
      flash[:errors] = @picture.errors.full_messages
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
  end

private
  def picture_params
  params.require(:picture).permit(:place_id, :description, :picture)
  end
end
