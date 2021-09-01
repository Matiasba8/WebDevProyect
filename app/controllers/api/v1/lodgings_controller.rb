class API::V1::LodgingsController < ApplicationController
  def index
    lodgings = Lodging.all
    render json: lodgings
  end

  def create
    lodging = Lodging.new(lodgings_params)
    if lodging.save
      render json: lodging
    else
      render json: "error"
    end
  end

  def show
    lodging = Lodging.find_by(params[:id])
    render json: lodging
  end

  def update
    lodging = Lodging.find(params[:id])
    lodging.update_attributes(lodgings_params)
    render json: lodging
  end

  def destroy
    Lodging.destroy(params[:id])
  end

  def lodgings_params
    params.require(:user).permit(:id, :user_id, :title, :description, :location, :amenities, :facilities, :equipment, :created_at, :updated_at)
  end

end
