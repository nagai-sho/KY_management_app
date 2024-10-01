class LocationsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @locations = @site.locations
  end
  def create
    @location = Location.new(location_params)
    if @location.save
      
    end
    
  end
  
  def update
    
  end

  private

  def location_params
    params.require(:location).permit(:content)
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
