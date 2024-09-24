class ProjectsController < ApplicationController
  def index
    @site = Site.includes(:projects).find(params[:site_id])
    @projects = @site.projects
    @project = @projects.first
    @ky_sheet = @project.ky_sheets.first if @project.present?
    # Rails.logger.debug "@site: #{@site.inspect}"
    # Rails.logger.debug "@projects: #{@projects.inspect}"
    # Rails.logger.debug "@project: #{@project.inspect}"
    # Rails.logger.debug "@ky_sheet: #{@ky_sheet.inspect}"
  end
  def new
    @site = Site.find(params[:site_id])
    @project = @site.projects.new
  end
end
