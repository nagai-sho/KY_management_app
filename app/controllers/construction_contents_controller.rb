class ConstructionContentsController < ApplicationController
  before_action :set_site, only: [:index, :create]
  def index
    @construction_contents = @site.construction_contents().page(params[:page]).per(5)
    @construction_content = ConstructionContent.new
  end
  
  def create
    @construction_content = @site.construction_contents.build(construction_content_params)
    if @construction_content.save
      redirect_to site_construction_contents_path(@site), notice: '作業場所の作成に成功しました！'
    else
      @construction_contents = @site.construction_contents.reject { |construction_content| construction_content.new_record? }
      flash.now[:alert] = '作業場所の作成に失敗しました。'
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    construction_content = ConstructionContent.find(params[:id])
    site = construction_content.site
    construction_content.destroy
    redirect_to site_construction_contents_path(site)
  end
  
  private
  
  def construction_content_params
    params.require(:construction_content).permit(:content)
  end
  
  def set_site
    @site = Site.find(params[:site_id])
  end

end
