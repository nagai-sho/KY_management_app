class KySheetsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @site = @project.site
    @ky_sheet = @project.ky_sheets.build
    # @ky_sheet = Ky_sheet.new
  end

  private
  def ky_sheet_params
    params.require(:ky_sheet).permit(
      
      :risk_level_id,
      :incidence_rate_id,
      :construction_type_id,
    )
  end


end
