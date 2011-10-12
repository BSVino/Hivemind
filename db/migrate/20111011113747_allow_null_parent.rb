class AllowNullParent < ActiveRecord::Migration
  def change
    change_column :tasks, :parent_id, :integer, :null => true
  end
end
