class LocationsController < ApplicationController
  before_action :set_ky_sheet, only: :index
  def index
    @locations = @ky_sheet.locations
  end
  def new
    
  end

  private
  def set_ky_sheet
    @ky_sheet = KySheet.find(params[:ky_sheet_id])
  end
end
