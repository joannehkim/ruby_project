class CostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Cost.create(cost_params)
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
  def cost_params
  params.require(:cost).permit(:category, :place_id, :cost, :company, :description)
  end
end
