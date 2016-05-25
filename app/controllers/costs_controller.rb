class CostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @cost = Cost.create(cost_params)
    if @cost.save
      redirect_to :back
    else
      flash[:errors] = @cost.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @cost = Cost.find(params[:id])
  end

  def edit
  end

  def update
    @cost = Cost.find(params[:id])
    if @cost.update(cost_params)
      redirect_to "/cost/#{@cost.id}"
    else
      flash[:errors] = @cost.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @cost = Cost.find(params[:id])
    if @cost.destroy
      redirect_to :back
    end
  end

private
  def cost_params
  params.require(:cost).permit(:category, :place_id, :cost, :company, :description)
  end

end