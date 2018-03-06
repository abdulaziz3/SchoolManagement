class User < ActiveRecord::Base

	acts_as_messageable

	has_secure_password
	GENDER = ["Male", "Female"]

	VALID_EMAIL_VAL = /\A[\w+\-.]+@[A-z\d\-.]+\.[a-z]+\z/i
	before_save {self.email = email.downcase}
	validate :unique_student_email
	validate :unique_parent_email

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

	def mailboxer_name
    full_name
  end

	def mailboxer_email(object)
		self.email
	end

	def self.search(query)
		where("f_name LIKE ? OR l_name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.searchAll(query)
    joins(:student).where("f_name LIKE ? OR l_name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def unique_student_email
		self.errors.add(:email, 'Email is already taken by student') if Student.where(email: self.email).exists?
	end

	def unique_parent_email
		self.errors.add(:email, 'Email is already taken by Parent') if Parent.where(email: self.email).exists?
	end

end
