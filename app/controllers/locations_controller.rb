class LocationsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  before_action :set_location, only: [:destroy]
  def index
    @locations = @site.locations
    @location = @site.locations.new
  end
  
  def create
    @location = @site.locations.build(location_params)
    if @location.save
      respond_to do |format|
        format.html {redirect_to @location, notice: '作業場所の作成に成功しました！'}
        format.js
      end
    else
      @locations = @site.locations
      respond_to do |format|
        format.html { render :index }
        format.js
      end
    end
  end
  
  def destroy
    @site = @location.site
    @location.destroy
    respond_to do |format|
      format.html { redirect_to location_path(@site), notice: '作業場所を削除しました'}
      format.js
    end
  end
  
  private
  
  def location_params
    params.require(:location).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end
  
  def set_location
    @location = Location.find(params[:id])
  end

end