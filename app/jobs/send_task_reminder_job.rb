class SendTaskReminderJob < ApplicationJob
  queue_as :default

  def perform(task)
    TaskMailer.reminder(task).deliver_now
  end
end
