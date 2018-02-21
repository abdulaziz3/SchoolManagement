class Homework < ActiveRecord::Base

  belongs_to :subject
  belongs_to :user

  has_many :student_homeworks
	has_many :students, through: :student_homeworks

end
