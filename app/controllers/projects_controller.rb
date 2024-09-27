class ProjectsController < ApplicationController
  before_action :set_site, only: [:index, :new, :create]
  def index
    @projects = @site.projects
  end
  def new
    @project = @site.projects.new
  end
  
  def create
    @project = @site.projects.new(project_params)
    if @project.save
      redirect_to site_projects_path(@site), notice: '工事件名が正常に作成されました。'
    else
      flash.now[:alert] = '工事件名の作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def project_params
    params.require(:project).permit(
      :name,
      :client,
      :construction_start,
      :construction_completion,
      :construction_content,
      )
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
