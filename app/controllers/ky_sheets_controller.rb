class KySheetsController < ApplicationController
  before_action :set_project, only: [:index, :new]
  def index
    @ky_sheets = @project.ky_sheets
  end
  def new
    @ky_sheets = @project.ky_sheets
    @ky_sheet = Ky_sheets.new
  end
  
  def show
  end
  
  def edit
  end

  private
  def ky_sheet_params
    params.require(:ky_sheet).permit(
      
      :risk_level_id,
      :incidence_rate_id,
      :construction_type_id,
    )
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
