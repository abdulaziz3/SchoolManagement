class Mark < ActiveRecord::Base

	belongs_to :subject
	belongs_to :student
	belongs_to :users

end
