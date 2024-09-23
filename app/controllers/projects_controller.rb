class ProjectsController < ApplicationController
  def index
    @site = Site.includes(:projects).find(params[:site_id])
    @projects = @site.projects
  end
  def new
    @site = Site.find(params[:site_id])
    @project = @site.projects.new
  end
end
