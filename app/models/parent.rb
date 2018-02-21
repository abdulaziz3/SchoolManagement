class Parent < ActiveRecord::Base

  has_secure_password

  has_many :students

  VALID_EMAIL_VAL = /\A[\w+\-.]+@[A-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true , length: {maximum: 105},
		 uniqueness: {case_sensitvity: false},
		 format: { with: VALID_EMAIL_VAL }
     before_save {self.email = email.downcase}

     validate :unique_user_email
     validate :unique_student_email

  def full_name
  	"#{f_name} #{l_name}"
  end

  def unique_student_email
		self.errors.add(:email, 'Email is already taken by student') if Student.where(email: self.email).exists?
	end

	def unique_user_email
		self.errors.add(:email, 'Email is already taken by staff') if User.where(email: self.email).exists?
	end
end
