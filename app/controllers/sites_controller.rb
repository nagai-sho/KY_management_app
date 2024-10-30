class SitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sites = Site.all().order(created_at: :desc)
  end
  def new
    @site = Site.new
  end
  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to root_path, notice: '現場名が正常に作成されました！'
    else
      flash.now[:alert] = '現場名の作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    site = Site.find(params[:id])
    site.update(site_params)
    redirect_to root_path
  end

  def destroy
    site = Site.find(params[:id])
    site.destroy
    redirect_to root_path
  end
  
  def item_list
    @site = Site.find(params[:id])
  end

  private
  def site_params
    params.require(:site).permit(:name, :postal_code, :address)
  end
end
