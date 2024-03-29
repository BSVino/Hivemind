class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :task_folder

  validates_presence_of :project
  validates_presence_of :task_folder
  validates_presence_of :name
  validates_presence_of :tasktype
  validates_numericality_of :difficulty,  :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
end
