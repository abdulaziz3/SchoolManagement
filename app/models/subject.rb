class Subject < ActiveRecord::Base

	belongs_to :grade
	belongs_to :user
	has_many :homeworks
	has_many :marks, through: :homework

	has_many :student_subjects
	has_many :students, through: :student_subjects

	validates :subject_name, presence: true
	validates :subject_name, uniqueness: true
	validates :subject_code, presence: true
	validates :subject_code, uniqueness: true
	validates_presence_of :grade, :if => :no_grads?
	validates_presence_of :user, :if => :no_users?

protected

	def no_grads?
		grade.nil?
	end

	def no_users?
		user.nil?
	end

end
