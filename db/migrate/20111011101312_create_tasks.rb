class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :tasktype
      t.integer :difficulty
      t.belongs_to :task
      t.belongs_to :project

      t.timestamps
    end
    add_index :tasks, :task_id
    add_index :tasks, :project_id
  end
end
