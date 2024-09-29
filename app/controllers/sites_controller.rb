class SitesController < ApplicationController
  def index
    @sites = Site.all
  end
  def new
    @site = Site.new
  end
  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to root_path, notice: '現場名が正常に作成されました。'
    else
      flash.now[:alert] = '現場名の作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    site = Site.find(params[:id])
    site.destroy
    redirect_to root_path
  end

  private
  def site_params
    params.require(:site).permit(:name, :postal_code, :address)
  end
end
