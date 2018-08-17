class Student < ActiveRecord::Base

    has_many :lessons
    has_many :teachers, through: :lessons 

    validates :name, presence: true 
    validates :category, presence: true 
    validates :level, presence: true 

end 