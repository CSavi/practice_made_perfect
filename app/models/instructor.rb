class Instructor < ActiveRecord::Base

    has_many :lessons
    has_many :students, through: :lessons 

    has_many :assignments

    has_secure_password

    validates :name, presence: true 
    validates :type, presence: true 
    validates :password, presence: true 
    validates :password, length: { in: 2..8 }
    validates :instructor_id, presence: true 
    validates :instructor_id, numericality: true 
end 