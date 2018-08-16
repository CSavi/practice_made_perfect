class Instructor < ActiveRecord::Base

    has_many :lessons
    has_many :teachers, through: :lessons 

    validates :name, presence: true 
    validates :type, presence: true 
    validates :level, presence: true 
    validates :student_id, uniqueness: true 
    validates :student_id, numericality: true 

end 