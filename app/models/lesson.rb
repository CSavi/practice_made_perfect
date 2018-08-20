class Lesson < ActiveRecord::Base

    belongs_to :instructor
    belongs_to :student 

    validates :description, presence: true 

    validates :lesson_datetime, presence: true 

    validates :student_id, presence: true
    validates :student_id, numericality: { only_integer: true }
    
    validates :instructor_id, presence: true  
    validates :instructor_id, numericality: { only_integer: true }
     
    scope :recent, -> { order("lessons.lesson_datetime DESC")}
   
end