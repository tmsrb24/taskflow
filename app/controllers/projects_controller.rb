class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
    @tasks = @project.tasks.order(position: :asc)
    if params[:filter] == "completed"
      @tasks = @tasks.where(completed: true)
    elsif params[:filter] == "incomplete"
      @tasks = @tasks.where(completed: false)
    end

    if params[:tag].present?
      @tasks = @tasks.tagged_with(params[:tag])
    end
  end

  def new
    @project = current_user.projects.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "projects/form", locals: { project: @project }) }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "projects/form", locals: { project: @project }) }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@project) }
    end
  end

  private
    def set_project
      @project = current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
