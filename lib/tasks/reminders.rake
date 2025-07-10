namespace :tasks do
  desc "Send reminders for tasks due tomorrow"
  task send_reminders: :environment do
    tasks_due_tomorrow = Task.where(due_date: Date.tomorrow, completed: false)
    tasks_due_tomorrow.each do |task|
      puts "Enqueuing reminder for task: #{task.title}"
      SendTaskReminderJob.perform_later(task)
    end
    puts "Enqueued reminders for #{tasks_due_tomorrow.count} tasks."
  end
end
