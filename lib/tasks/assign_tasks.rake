namespace :tasks do
  desc "Assign all existing tasks to the first user, create one if none exists"
  task assign_to_first_user: :environment do
    user = User.first
    if user.nil?
      user = User.create!(email: "default@example.com", password: "password", password_confirmation: "password")
      puts "Created a default user: default@example.com / password"
    end

    Task.where(user_id: nil).update_all(user_id: user.id)
    puts "Assigned #{Task.where(user_id: user.id).count} tasks to #{user.email}"
  end
end
