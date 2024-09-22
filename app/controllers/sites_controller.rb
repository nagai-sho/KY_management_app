class SitesController < ApplicationController
  def index
    @site = Site.all
  end
  def new
    
  end
end
