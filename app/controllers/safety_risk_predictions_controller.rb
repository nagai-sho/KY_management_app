class SafetyRiskPredictionsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @safety_risk_predictions = @site.safety_risk_predictions
    @safety_risk_prediction = SafetyRiskPrediction.new
  end
  
  def create
    @safety_risk_prediction = @site.safety_risk_predictions.build(safety_risk_prediction_params)
    if @safety_risk_prediction.save
      redirect_to site_safety_risk_predictions_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @safety_risk_predictions = @site.safety_risk_predictions.reject { |safety_risk_prediction| safety_risk_prediction.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    safety_risk_prediction = SafetyRiskPrediction.find(params[:id])
    site = safety_risk_prediction.site
    safety_risk_prediction.destroy
    redirect_to site_safety_risk_predictions_path(site)
  end
  
  private
  
  def safety_risk_prediction_params
    params.require(:safety_risk_prediction).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end


end
