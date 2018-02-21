class StudentHomework < ActiveRecord::Base
  belongs_to :Student
  belongs_to :homework
end
