class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: %i[ show edit update destroy toggle_completion ]

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def edit
  end

  def create
    @task = @project.tasks.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: "Task was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "tasks/form", locals: { project: @project, task: @task }) }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: "Task was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "tasks/form", locals: { project: @project, task: @task }) }
      end
    end
  end

  def toggle_completion
    @task.update(completed: !@task.completed)
    respond_to do |format|
      format.html { redirect_to @project, notice: "Task status was successfully updated." }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@task) }
    end
  end

  def move
    @task.insert_at(params[:position].to_i)
    head :ok
  end

  # DELETE /projects/:project_id/tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: "Task was successfully destroyed." }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
    end
  end

  private
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :completed, :tag_list)
    end
end
