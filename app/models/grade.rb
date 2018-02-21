class Grade < ActiveRecord::Base

has_many :subjects
has_many :students

validates :grade_name, presence: true
validates :grade_name, uniqueness: true
end
