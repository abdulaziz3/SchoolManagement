class Subject < ActiveRecord::Base

	has_many :students
	
	has_one :teacher


end
