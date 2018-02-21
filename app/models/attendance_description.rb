class AttendanceDescription < ActiveRecord::Base
  has_many :student_attendances
  has_many :students, through: :student_attendances
end
