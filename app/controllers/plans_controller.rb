class PlansController < ApplicationController
  respond_to :json
  def index
    respond_to do |format|
      format.json { render json: Plan.all }
      format.html
    end
  end

  def create
    respond_with Plan.create(plan_params)
  end

  def edit
  end

  def update
  end

  def destroy
    respond_with Plan.destroy(params[:id])
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :description, :price)
  end
end
