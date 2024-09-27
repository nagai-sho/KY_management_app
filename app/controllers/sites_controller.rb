class SitesController < ApplicationController
  def index
    @sites = Site.all
  end
  def new
    @site = Site.new
  end
  def create
    @site = Site.create(params[:id])
    if @site.save
      redirect_to root_path
    else
      render new_site_path
    end
  end
end
