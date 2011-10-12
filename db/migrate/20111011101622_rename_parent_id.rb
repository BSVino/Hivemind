class RenameParentId < ActiveRecord::Migration
  def change
	rename_column :tasks, :task_id, :parent_id
  end
end
