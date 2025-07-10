class TaskMailer < ApplicationMailer
  def reminder(task)
    @task = task
    @user = task.user

    mail to: @user.email, subject: "Reminder: Your task is due soon!"
  end
end
