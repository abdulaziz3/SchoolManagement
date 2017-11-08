class Student < ActiveRecord::Base

	has_many :subjects

	has_secure_password
	validates_uniqueness_of :email
	before_save {self.email = email.downcase}
	VALID_EMAIL_VAL = /\A[\w+\-.]+@[A-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true , length: {maximum: 105},
		 uniqueness: {case_sensitvity: false},
		 format: { with: VALID_EMAIL_VAL }

	validates :f_name, presence: true, length: {minimum: 3, maximum: 20}
	validates :l_name, presence: true, length: {minimum: 3, maximum: 20}
	validates :dob, presence: true, length: {minimum: 3, maximum: 20}
	validates :nationality, presence: true, length: {minimum: 3, maximum: 20}
	validates :city, presence: true, length: {minimum: 3, maximum: 20}
	validates :address, presence: true, length: {minimum: 3, maximum: 100}
	validates :phone, presence: true, length: {minimum: 3, maximum: 20}
 	validates :post_code, presence: true, length: {minimum: 3, maximum: 20}

end
