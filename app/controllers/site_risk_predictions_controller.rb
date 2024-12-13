class SiteRiskPredictionsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @site_risk_predictions = @site.site_risk_predictions().page(params[:page]).per(5)
    @site_risk_prediction = SiteRiskPrediction.new
  end
  
  def create
    @site_risk_prediction = @site.site_risk_predictions.build(site_risk_prediction_params)
    if @site_risk_prediction.save
      redirect_to site_site_risk_predictions_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @site_risk_predictions = @site.site_risk_predictions().page(params[:page]).per(5)
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    site_risk_prediction = SiteRiskPrediction.find(params[:id])
    site = site_risk_prediction.site
    site_risk_prediction.destroy
    redirect_to site_site_risk_predictions_path(site)
  end
  
  private
  
  def site_risk_prediction_params
    params.require(:site_risk_prediction).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end


end
