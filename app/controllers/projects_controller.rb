class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:index, :new, :create]

  def index
    @keyword = params[:keyword]
    if @keyword.present?
      @projects = @site.projects.search(@keyword).order(created_at: :desc).page(params[:page]).per(5)
    else
      @projects = @site.projects().order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = @site.projects.build(project_params)
    if @project.save
      redirect_to site_projects_path(@site), notice: '工事件名が正常に作成されました。'
    else
      flash.now[:alert] = '工事件名の作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
    @site = @project.site
  end
  
  def update
    project = Project.find(params[:id])
    @site = project.site
    project.update(project_params)
    redirect_to site_projects_path(@site)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to site_projects_path(@project.site)
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
