class ProjectsController < ApplicationController
  def index
    @site = Site.all
  end
  def new
    @site = Site.all
  end
end
