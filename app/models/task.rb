class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :parent, :class_name => "Task", :foreign_key => "parent_id"
  has_many :children, :class_name => "Task", :dependent => :destroy

  validates_presence_of :project
  validates_presence_of :name
  validates_presence_of :tasktype
  validates_numericality_of :difficulty,  :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
end
