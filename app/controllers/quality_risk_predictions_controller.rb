class QualityRiskPredictionsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @quality_risk_predictions = @site.quality_risk_predictions().page(params[:page]).per(5)
    @quality_risk_prediction = QualityRiskPrediction.new
  end
  
  def create
    @quality_risk_prediction = @site.quality_risk_predictions.build(quality_risk_prediction_params)
    if @quality_risk_prediction.save
      redirect_to site_quality_risk_predictions_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @quality_risk_predictions = @site.quality_risk_predictions.reject { |quality_risk_prediction| quality_risk_prediction.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    quality_risk_prediction = QualityRiskPrediction.find(params[:id])
    site = quality_risk_prediction.site
    quality_risk_prediction.destroy
    redirect_to site_quality_risk_predictions_path(site)
  end
  
  private
  
  def quality_risk_prediction_params
    params.require(:quality_risk_prediction).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end



end
