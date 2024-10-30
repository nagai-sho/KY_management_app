class KySheetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @site = @project.site
    @ky_sheets = @project.ky_sheets.with_attached_pdf_file.order(created_at: :desc)
  end

  def destroy
    @ky_sheet = KySheet.find(params[:id])
    @project = @ky_sheet.project

    @ky_sheet.destroy
    redirect_to project_ky_sheets_path(@project), notice: 'PDFが削除されました'
  end

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
  
  # def preview_pdf
  #   @project = Project.find(params[:project_id])
  #   @site = @project.site
  #   @ky_sheet = @project.ky_sheets.build(ky_sheet_params)
    
  #   if @ky_sheet.valid?
  #     generate_pdf_and_send(@ky_sheet)
  #   else
  #     render :new
  #   end
  # end
  
  def create
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
      
      @location_1 = Location.find(@ky_sheet.location_id_1)
      @location_2 = Location.find(@ky_sheet.location_id_2)
      @location_3 = Location.find(@ky_sheet.location_id_3)
      @location_4 = Location.find(@ky_sheet.location_id_4)
      @location_5 = Location.find(@ky_sheet.location_id_5)
      @construction_content_1 = ConstructionContent.find(@ky_sheet.construction_content_id_1)
      @construction_content_2 = ConstructionContent.find(@ky_sheet.construction_content_id_2)
      @construction_content_3 = ConstructionContent.find(@ky_sheet.construction_content_id_3)
      @construction_content_4 = ConstructionContent.find(@ky_sheet.construction_content_id_4)
      @safety_risk_prediction_1 = SafetyRiskPrediction.find(@ky_sheet.safety_risk_prediction_id_1)
      @safety_risk_prediction_2 = SafetyRiskPrediction.find(@ky_sheet.safety_risk_prediction_id_2)
      @safety_risk_measure_1 = SafetyRiskMeasure.find(@ky_sheet.safety_risk_measure_id_1)
      @safety_risk_measure_2 = SafetyRiskMeasure.find(@ky_sheet.safety_risk_measure_id_2)
      @quality_risk_prediction = QualityRiskPrediction.find(@ky_sheet.quality_risk_prediction_id)
      @quality_risk_measure = QualityRiskMeasure.find(@ky_sheet.quality_risk_measure_id)
      @site_risk_prediction = SiteRiskPrediction.find(@ky_sheet.site_risk_prediction_id)
      @site_risk_measure = SiteRiskMeasure.find(@ky_sheet.site_risk_measure_id)
      @risk_level_1 = RiskLevel.find(@ky_sheet.risk_level_id_1)
      @risk_level_2 = RiskLevel.find(@ky_sheet.risk_level_id_2)
      @risk_level_3 = RiskLevel.find(@ky_sheet.risk_level_id_3)
      @risk_level_4 = RiskLevel.find(@ky_sheet.risk_level_id_4)
      @risk_level_5 = RiskLevel.find(@ky_sheet.risk_level_id_5)
      @incidence_rate_1 = IncidenceRate.find(@ky_sheet.incidence_rate_id_1)
      @incidence_rate_2 = IncidenceRate.find(@ky_sheet.incidence_rate_id_2)
      @incidence_rate_3 = IncidenceRate.find(@ky_sheet.incidence_rate_id_3)
      @incidence_rate_4 = IncidenceRate.find(@ky_sheet.incidence_rate_id_4)
      @incidence_rate_5 = IncidenceRate.find(@ky_sheet.incidence_rate_id_5)
    
      if @ky_sheet.save

        html_content = render_to_string(template: 'ky_sheets/show', layout: false)
        html_path = Rails.root.join('tmp', "ky_sheet_#{@ky_sheet.id}.html")
        File.write(html_path, html_content)
        
        pdf_path = Rails.root.join('tmp', "ky_sheet_#{@ky_sheet.id}.pdf")
        pdf_service = PdfGeneratorService.new( html_path.to_s, pdf_path.to_s )
        pdf_service.generate_pdf

        # PDFをActiveStorageに添付（保存）する処理
        # ファイルをActiveStorageで管理しつつ、関連するモデルをデータベースに保存せずにファイルだけを扱う
        @ky_sheet.pdf_file.attach(
          io: File.open(pdf_path),
          filename: "#{Time.current.to_date}_#{@project.name}.pdf",
          # filename: "kYシート_#{@project.name}_#{Time.current.to_i}.pdf", # 現在のUNIXタイムスタンプ（秒単位の整数）で一意性のファイルを生成
          content_type: 'application/pdf'
        )
        # 一時ファイルを削除
        File.delete(html_path) if File.exist?(html_path)
        File.delete(pdf_path) if File.exist?(pdf_path)

        redirect_to project_ky_sheets_path(@project), notice: 'PDFが正常に生成されました！'
      end
    else
      flash.now[:alert] = 'PDFの作成に失敗しました。全ての項目を入力してください。'
      render :new, status: :unprocessable_entity
    end
    # 万が一、エラーハンドリングが出来ない場合
    rescue => e
      flash.now[:alert] = "エラーが発生しました: #{e.message}　全ての項目を入力してください。"
      render :new, status: :unprocessable_entity
    # 応急処置として、全てのエラーを補足する rescue => e を使用
  end
  
  
  private
  
  def ky_sheet_params
    params.require(:ky_sheet).permit(
      :construction_type_id,
      :construction_date,
      :location_id_1, :location_id_2, :location_id_3, :location_id_4, :location_id_5,
      :construction_content_id_1, :construction_content_id_2,:construction_content_id_3, :construction_content_id_4,
      :safety_risk_prediction_id_1, :safety_risk_prediction_id_2,
      :safety_risk_measure_id_1, :safety_risk_measure_id_2,
      :quality_risk_prediction_id,
      :quality_risk_measure_id,
      :site_risk_prediction_id,
      :site_risk_measure_id,
      :priority_content,
      :priority_measure_risk,
      :priority_measure,
      :risk_level_id_1, :risk_level_id_2, :risk_level_id_3, :risk_level_id_4, :risk_level_id_5,
      :incidence_rate_id_1, :incidence_rate_id_2, :incidence_rate_id_3, :incidence_rate_id_4, :incidence_rate_id_5,
      :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6,
      :signature_sig1, :signature_sig2, :signature_sig3, :signature_sig4, :signature_sig5, :signature_sig6,
      :signature_sig7, :signature_sig8, :signature_sig9, :signature_sig10, :signature_sig11,
      :worker,
      :manager,
      :pdf_file,
    )
  end
    
  def generate_pdf_and_send(ky_sheet)
    @ky_sheet = ky_sheet
      
    respond_to do |format|
      format.html do
        html_content = render_to_string(template: 'ky_sheets/show', layout: false)
        File.write(html_path, html_content)
        html_path = Rails.root.join('tmp', "ky_sheet_#{@ky_sheet.id}.html")
        
        pdf_path = Rails.root.join('tmp', "ky_sheet_#{@ky_sheet.id}.pdf")
        pdf_service = PdfGeneratorService.new( html_path.to_s, pdf_path.to_s )
        pdf_service.generate_pdf
        # PDFのプレビュー表示
        send_file pdf_path, type: 'application/pdf', disposition: 'inline'
      end
      format.turbo_stream { redirect_to root_path }
    end
  end

  def pdf_params
    params.require(:ky_sheet).permit(:pdf_file, :construction_date).merge(user_id: current_user.id)
  end

  def set_parameter
    @ky_sheet.user = current_user
    @site_risk_predictions = @site.site_risk_predictions
    @site_risk_measures = @site.site_risk_measures
    @safety_risk_predictions = @site.safety_risk_predictions
    @safety_risk_measures = @site.safety_risk_measures
    @quality_risk_predictions = @site.quality_risk_predictions
    @quality_risk_measures = @site.quality_risk_measures
    @locations = @site.locations
    @construction_contents = @site.construction_contents

    @location_1 = Location.find(@ky_sheet.location_id_1)
    @location_2 = Location.find(@ky_sheet.location_id_2)
    @location_3 = Location.find(@ky_sheet.location_id_3)
    @location_4 = Location.find(@ky_sheet.location_id_4)
    @location_5 = Location.find(@ky_sheet.location_id_5)
    @construction_content_1 = ConstructionContent.find(@ky_sheet.construction_content_id_1)
    @construction_content_2 = ConstructionContent.find(@ky_sheet.construction_content_id_2)
    @construction_content_3 = ConstructionContent.find(@ky_sheet.construction_content_id_3)
    @construction_content_4 = ConstructionContent.find(@ky_sheet.construction_content_id_4)
    @safety_risk_prediction_1 = SafetyRiskPrediction.find(@ky_sheet.safety_risk_prediction_id_1)
    @safety_risk_prediction_2 = SafetyRiskPrediction.find(@ky_sheet.safety_risk_prediction_id_2)
    @safety_risk_measure_1 = SafetyRiskMeasure.find(@ky_sheet.safety_risk_measure_id_1)
    @safety_risk_measure_2 = SafetyRiskMeasure.find(@ky_sheet.safety_risk_measure_id_2)
    @quality_risk_prediction = QualityRiskPrediction.find(@ky_sheet.quality_risk_prediction_id)
    @quality_risk_measure = QualityRiskMeasure.find(@ky_sheet.quality_risk_measure_id)
    @site_risk_prediction = SiteRiskPrediction.find(@ky_sheet.site_risk_prediction_id)
    @site_risk_measure = SiteRiskMeasure.find(@ky_sheet.site_risk_measure_id)
    @risk_level_1 = RiskLevel.find(@ky_sheet.risk_level_id_1)
    @risk_level_2 = RiskLevel.find(@ky_sheet.risk_level_id_2)
    @risk_level_3 = RiskLevel.find(@ky_sheet.risk_level_id_3)
    @risk_level_4 = RiskLevel.find(@ky_sheet.risk_level_id_4)
    @risk_level_5 = RiskLevel.find(@ky_sheet.risk_level_id_5)
    @incidence_rate_1 = IncidenceRate.find(@ky_sheet.incidence_rate_id_1)
    @incidence_rate_2 = IncidenceRate.find(@ky_sheet.incidence_rate_id_2)
    @incidence_rate_3 = IncidenceRate.find(@ky_sheet.incidence_rate_id_3)
    @incidence_rate_4 = IncidenceRate.find(@ky_sheet.incidence_rate_id_4)
    @incidence_rate_5 = IncidenceRate.find(@ky_sheet.incidence_rate_id_5)
  end
end
