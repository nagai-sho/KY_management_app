class KySheetsController < ApplicationController
  before_action :set_project, only: [:new]
  def new
    @ky_sheet = @project.ky_sheets.build
    # @ky_sheet = Ky_sheet.new
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
