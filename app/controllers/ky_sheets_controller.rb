class KySheetsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @site = @project.site
    @ky_sheet = @project.ky_sheets.build

    @site_risk_predictions = @site.site_risk_predictions
    @site_risk_measures = @site.site_risk_measures
    @safety_risk_predictions = @site.safety_risk_predictions
    @safety_risk_measures = @site.safety_risk_measures
    @quality_risk_predictions = @site.quality_risk_predictions
    @quality_risk_measures = @site.quality_risk_measures
    @locations = @site.locations
    @construction_contents = @site.construction_contents
  end
  
  def preview_pdf
    @project = Project.find(params[:project_id])
    @site = @project.site
    @ky_sheet = @project.ky_sheets.build(ky_sheet_params)

    @ky_sheet.user = current_user
    @site_risk_predictions = @site.site_risk_predictions
    @site_risk_measures = @site.site_risk_measures
    @safety_risk_predictions = @site.safety_risk_predictions
    @safety_risk_measures = @site.safety_risk_measures
    @quality_risk_predictions = @site.quality_risk_predictions
    @quality_risk_measures = @site.quality_risk_measures
    @locations = @site.locations
    @construction_contents = @site.construction_contents

    if @ky_sheet.valid?
      gemerate_pdf_and_send(@ky_sheet)
    else
      render :new
    end
  end
  
  private

  def ky_sheet_params
    params.require(:ky_sheet).permit(
      :construction_completion,
      :site_risk_prediction_id,
      :site_risk_measure_id,
      :safety_risk_prediction_id,
      :safety_risk_measure_id,
      :quality_risk_prediction_id,
      :quality_risk_measure_id,
      :location_id,
      :construction_content_id,
      :risk_level_id,
      :incidence_rate_id,
      :construction_type_id,
      :answer_1,
      :answer_2,
      :answer_3,
      :answer_4,
      :answer_5,
      :answer_6,
      :signature_sig1,
      :signature_sig2,
      :signature_sig3,
      :signature_sig4,
      :signature_sig5,
      :signature_sig6,
      :signature_sig7,
      :signature_sig8,
      :signature_sig9,
      :signature_sig10,
      :signature_sig11,
    )
  end
    
  def gemerate_pdf_and_send(ky_sheet)
    @ky_sheet = ky_sheet
      
    respond_to do |format|
      format.html do
        html_content = render_to_string(template: 'ky_sheets/show', layout: false)
        html_path = Rails.root.join('tmp', 'new_ky_sheet.html')
        File.write(html_path, html_content)
        
        pdf_service = PdfGeneratorService.new(html_path.to_s, Rails.root.join('tmp', 'new_ky_sheet.pdf').to_s)
        pdf_service.generate_pdf
        
        send_file Rails.root.join('tmp', 'new_ky_sheet.pdf'), type: 'application/pdf', disposition: 'inline'
      end
      format.turbo_stream { redirect_to root_path }
    end
  end

end
