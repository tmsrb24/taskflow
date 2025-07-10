namespace :projects do
  desc "Assign all existing tasks to a default project for each user"
  task assign_default_project: :environment do
    User.find_each do |user|
      default_project = user.projects.find_or_create_by!(name: "Default Project") do |project|
        project.description = "Default project for existing tasks."
      end

      tasks_to_assign = user.tasks.where(project_id: nil)
      if tasks_to_assign.any?
        tasks_to_assign.update_all(project_id: default_project.id)
        puts "Assigned #{tasks_to_assign.count} tasks to '#{default_project.name}' for user #{user.email}."
      else
        puts "No tasks to assign for user #{user.email}."
      end
    end
  end
end
