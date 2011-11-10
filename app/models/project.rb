class Project < ActiveRecord::Base
	has_many :tasks, :dependent => :destroy

	validates_presence_of :engine
	validates_presence_of :name
	validates_presence_of :genre
	validates_presence_of :status
	validates_presence_of :players
	validates_presence_of :description
end
