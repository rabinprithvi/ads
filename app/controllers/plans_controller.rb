class PlansController < ApplicationController
  respond_to :json

  def index
    render :json => Plan.all, :include => {:features => {:only => [:id, :name, :limit]}}, :except => [:created_at, :updated_at]
  end

  def create
    respond_with Plan.create(plan_params)
  end

  def edit
    render :json => Plan.find(params[:id]), :include => {:features => {:only => [:name, :limit]}}, :except => [:created_at, :updated_at]
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
    params.require(:plan).permit(:name, :description, :price, features_attributes: [:id, :name, :limit])
  end
end
