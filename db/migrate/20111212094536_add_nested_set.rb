class AddNestedSet < ActiveRecord::Migration
  def change
  	add_column :task_folders, :lft, :integer
  	add_column :task_folders, :rgt, :integer
	add_index :task_folders, :parent_id
  end
end
