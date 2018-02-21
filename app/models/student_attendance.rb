class StudentAttendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :attendance_description

  def self.searchAttendance(query)
    joins(:student).where("f_name LIKE ? OR l_name LIKE ? OR date LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end

  def self.checkAttendance(query)
    todaysDate = Date.today
    joins(:student).where("grade_id = ? && date LIKE ?", "#{query}", "%#{todaysDate}%")
	end
end
