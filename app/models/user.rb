class User < ActiveRecord::Base

	has_secure_password
	GENDER = ["Male", "Female"]

	VALID_EMAIL_VAL = /\A[\w+\-.]+@[A-z\d\-.]+\.[a-z]+\z/i
	before_save {self.email = email.downcase}
	validate :unique_email

	belongs_to :role
	has_many :subjects

	has_many :homeworks
	has_many :marks

	validates :email, presence: true , length: {maximum: 105},
							uniqueness: {case_sensitvity: false}, format: { with: VALID_EMAIL_VAL }

	validates :f_name, presence: true, length: {maximum: 25}
 	validates :l_name, presence: true, length: {maximum: 25}

	validates :national_id, presence: true, length: {minimum: 10, maximum: 15}
	validates :gender, presence: true, length: {minimum: 3, maximum: 20}


	def full_name
		"#{f_name} #{l_name}"
	end

	def self.search(query)
		where("f_name LIKE ? OR l_name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def unique_email
		self.errors.add(:email, 'is already taken')
        if Student.where(email: self.email).exists? ||
           Parent.where(email: self.email).exists?
	end

end
