class RenameNameToTitleInTasks < ActiveRecord::Migration[8.0]
  def change
    rename_column :tasks, :name, :title
  end
end
