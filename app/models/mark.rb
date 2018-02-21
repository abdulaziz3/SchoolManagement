class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :student
  belongs_to :subject

  def self.checkMark(query)
    where("Homework_id = ", "#{query}")
	end

end
