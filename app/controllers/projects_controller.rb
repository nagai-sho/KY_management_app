class ProjectsController < ApplicationController
  def index
    @site = Site.find(params[:site_id])
    @projects = @site.projects
  end
  def new
    @site = Site.find(params[:site_id])
    @project = @site.projects.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to site_projects_path notice: '工事件名が正常に作成されました。'
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
end
