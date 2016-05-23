class PicturesController < ApplicationController
  def index
  end

  def new
  end

  def create
    Picture.create(picture_params)
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
  def picture_params
  params.require(:picture).permit(:place_id, :description, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at)
  end
end
