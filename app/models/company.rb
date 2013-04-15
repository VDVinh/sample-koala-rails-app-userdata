class Company < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation, :description, :phone
	has_many :jobs , dependent: :destroy
	has_secure_password
   	before_save{ |company| company.email = email.downcase} 
    before_save :create_remember_token
   	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, 
  					uniqueness: {case_sensitive: false}
   	validates :name, presence: true, length: { maximum: 50 }
   	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true

    private
      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
end