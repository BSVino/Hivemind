class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :genre, :string, :null => false, :default => ""
    add_column :projects, :players, :string, :null => false, :default => ""
    add_column :projects, :status, :string, :null => false, :default => "Unreleased"
    add_column :projects, :description, :text, :null => false, :default => ""
  end
end
