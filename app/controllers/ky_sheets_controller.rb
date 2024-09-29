class KySheetsController < ApplicationController
  before_action :set_project
  def index
    
  end
  def new
    @ky_sheet = @project.ky_sheets.new
  end
  
  def show
    @ky_sheet = @project.ky_sheets
  end
  
  def edit
    @projects = @site.projects
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

end
