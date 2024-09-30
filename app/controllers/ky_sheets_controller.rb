class KySheetsController < ApplicationController
  before_action :set_project, only: [:index, :new]
  def index
    @ky_sheets = @project.ky_sheets
  end
  def new
    @ky_sheet = @project.ky_sheets.new
  end
  
  def show
  end
  
  def edit
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

end
