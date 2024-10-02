class SiteRiskMeasuresController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @site_risk_measures = @site.site_risk_measures
    @site_risk_measure = SiteRiskMeasure.new
  end
  
  def create
    @site_risk_measure = @site.site_risk_measures.build(site_risk_measure_params)
    if @site_risk_measure.save
      redirect_to site_site_risk_measures_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @site_risk_measures = @site.site_risk_measures.reject { |site_risk_measure| site_risk_measure.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    site_risk_measure = SiteRiskMeasure.find(params[:id])
    site = site_risk_measure.site
    site_risk_measure.destroy
    redirect_to site_site_risk_measures_path(site)
  end
  
  private
  
  def site_risk_measure_params
    params.require(:site_risk_measure).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end



end
