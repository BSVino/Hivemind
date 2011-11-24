class TaskFolder < ActiveRecord::Base
  belongs_to :project
  belongs_to :parent, :class_name => "TaskFolder", :foreign_key => "parent_id"

  has_many :tasks, :dependent => :destroy

  validates_presence_of :project
  validates_presence_of :name
end
