class User < ApplicationRecord
	
	#the user-article relationship is 1-M
	has_many :articles
	
	#set user's email to all lowercase before saving
	before_save {self.email = email.downcase}
	
	#make sure each user's username is non-empty, unique (ignoring case-sensitivity), and between 3 and 25 characters
	validates :username, 
		presence: true,
		uniqueness: {case_sensitive: false},
		length: { minimum: 3, maximum: 25 }
	
	#define regular expression that makes sure emials are valid
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	#makes sure each user's email is present, unique, in the size range, and formatted correctly
	validates :email,
		presence: true,
		length: { maximum: 105},
		uniqueness: {case_sensitive: false},
		format: { with: VALID_EMAIL_REGEX }
		
	#allows for secure ruby gem to work 	
	has_secure_password
end