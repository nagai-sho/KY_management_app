class KySheetsController < ApplicationController
  def index
    
  end
  def new
    @site = Site.find(params[:site_id])
    @projects = @site.projects
  end
end
