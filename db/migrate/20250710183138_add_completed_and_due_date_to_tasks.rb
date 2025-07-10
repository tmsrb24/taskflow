class AddCompletedAndDueDateToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :completed, :boolean, default: false
    add_column :tasks, :due_date, :date
  end
end
