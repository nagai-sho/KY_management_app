class SitesController < ApplicationController
  def index
    @sites = Site.all
  end
  def new
    @site = Site.new
  end
  def create
    @site = Site.create(params[:id])
  end
end
