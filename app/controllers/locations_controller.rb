class LocationsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @locations = @site.locations().page(params[:page]).per(5)
    @location = Location.new
  end
  
  def create
    @location = @site.locations.build(location_params)
    if @location.save
      redirect_to site_locations_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @locations = @site.locations.reject { |location| location.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    location = Location.find(params[:id])
    site = location.site
    location.destroy
    redirect_to site_locations_path(site)
  end
  
  private
  
  def location_params
    params.require(:location).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end

end