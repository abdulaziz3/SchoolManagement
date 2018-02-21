class Student < ActiveRecord::Base

	has_secure_password
	GENDER = ["Male", "Female"]

	VALID_EMAIL_VAL = /\A[\w+\-.]+@[A-z\d\-.]+\.[a-z]+\z/i
	before_save {self.email = email.downcase}
	validate :unique_email

	belongs_to :grade
	belongs_to :parent

	has_many :attendances
	has_many :marks

	has_many :student_subjects
	has_many :subjects, through: :student_subjects

	has_many :student_homeworks
	has_many :homeworks, through: :student_homeworks

	has_many :student_attendances
	has_many :attendance_descriptions, through: :student_attendances



	validates :email, presence: true , length: {maximum: 105},
		 uniqueness: {case_sensitvity: false},
		 format: { with: VALID_EMAIL_VAL }


	validates :f_name, presence: true, length: {minimum: 3, maximum: 20}
	validates :l_name, presence: true, length: {minimum: 3, maximum: 20}
	validates :dob, presence: true, length: {minimum: 3, maximum: 20}
	validates :city, presence: true, length: {minimum: 3, maximum: 20}
	validates :address, presence: true, length: {minimum: 3, maximum: 100}
	validates :phone, presence: true, length: {minimum: 3, maximum: 20}
 	validates :post_code, presence: true, length: {minimum: 3, maximum: 20}


	def full_name
		"#{f_name} #{l_name}"
	end

	def unique_email
		self.errors.add(:email, 'is already taken')
        if User.where(email: self.email).exists? ||
           Parent.where(email: self.email).exists?
	end

end
