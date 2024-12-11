class QualityRiskMeasuresController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @quality_risk_measures = @site.quality_risk_measures().page(params[:page]).per(5)
    @quality_risk_measure = QualityRiskMeasure.new
  end
  
  def create
    @quality_risk_measure = @site.quality_risk_measures.build(quality_risk_measure_params)
    if @quality_risk_measure.save
      redirect_to site_quality_risk_measures_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @quality_risk_measures = @site.quality_risk_measures.reject { |quality_risk_measure| quality_risk_measure.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    quality_risk_measure = QualityRiskMeasure.find(params[:id])
    site = quality_risk_measure.site
    quality_risk_measure.destroy
    redirect_to site_quality_risk_measures_path(site)
  end
  
  private
  
  def quality_risk_measure_params
    params.require(:quality_risk_measure).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end




end
