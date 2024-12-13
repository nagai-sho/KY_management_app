class SafetyRiskMeasuresController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @safety_risk_measures = @site.safety_risk_measures().page(params[:page]).per(5)
    @safety_risk_measure = SafetyRiskMeasure.new
  end
  
  def create
    @safety_risk_measure = @site.safety_risk_measures.build(safety_risk_measure_params)
    if @safety_risk_measure.save
      redirect_to site_safety_risk_measures_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @safety_risk_measures = @site.safety_risk_measures().page(params[:page]).per(5)
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    safety_risk_measure = SafetyRiskMeasure.find(params[:id])
    site = safety_risk_measure.site
    safety_risk_measure.destroy
    redirect_to site_safety_risk_measures_path(site)
  end
  
  private
  
  def safety_risk_measure_params
    params.require(:safety_risk_measure).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end



end
