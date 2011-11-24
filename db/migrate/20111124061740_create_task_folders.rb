class CreateTaskFolders < ActiveRecord::Migration
  def change
    create_table :task_folders do |t|
      t.string :name
      t.integer :parent_id
      t.integer :project_id

      t.timestamps
    end

	change_table :tasks do |t|
	  t.remove :parent_id
	  t.integer :task_folder_id
	end
  end
end
