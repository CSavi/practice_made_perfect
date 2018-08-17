class Instructor < ActiveRecord::Base

    has_many :lessons
    has_many :students, through: :lessons 

    has_many :assignments

    has_secure_password

    validates :name, presence: true 
    validates :name, length: { minimum: 2 }
   
    validates :password, presence: true 
    validates :password, length: { in: 2..20 }
   
end 