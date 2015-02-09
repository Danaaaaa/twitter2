class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, 
             format: {with:  VALID_EMAIL_REGEX }
  validates :password, length: {minimum: 6 }
   before_save { self.email.downcase! }
  
  has_secure_password
end
