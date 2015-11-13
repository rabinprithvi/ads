class PlansController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :destroy, :update]
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
    respond_with Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    respond_with plan.update_attributes(plan_params)
  end

  def destroy
    respond_with Plan.destroy(params[:id])
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :description, :price)
  end
end
