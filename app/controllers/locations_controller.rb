class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50)
    else
      @locations = Location.order(:name)
    end
  end
end
