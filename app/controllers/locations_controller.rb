class LocationsController < ApplicationController
  def index
    respond_to do |format|
      format.js{ render json: current_user.locations }
      format.html { render :index }
    end
  end

  def show
    render json: current_user.locations.find( params[:id] )
  end

  def create
    render json: current_user.locations.create( location_params )
  end

  def update
    location = current_user.locations.find params[:id]
    location.address = location_params[:address]
    location.save
    render json: location
  end

  def destroy
    render json: current_user.locations.find(params[:id]).destroy
  end

  private

  def location_params
    params.require(:location).permit(:address)
  end
end
