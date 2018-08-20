class Student < ActiveRecord::Base

    has_many :lessons
    has_many :teachers, through: :lessons 

    validates :name, presence: true 
    validates :category, presence: true 
    validates :level, presence: true 

    scope :highest_level, -> { where("students.level =='Advanced'")}
    scope :moderate_level, -> { where("students.level =='Moderate'")}
    scope :beginner_level, -> { where("students.level =='Beginner'")}
end 