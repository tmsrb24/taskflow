class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.order(created_at: :desc)
    @tasks = current_user.tasks

    @tasks_due_today = @tasks.where(due_date: Date.today, completed: false)
    @tasks_overdue = @tasks.where("due_date < ?", Date.today).where(completed: false)
    @tasks_completed_today = @tasks.where(completed: true, updated_at: Date.today.all_day)

    @project_task_counts = @projects.joins(:tasks).group("projects.name").count
  end
end
