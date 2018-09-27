class Lesson < ActiveRecord::Base

    belongs_to :instructor
    belongs_to :student 
    has_many :comments

    validates :description, presence: true 

    validates :lesson_datetime, presence: true 
 

     
    scope :recent, -> { order("lessons.lesson_datetime DESC")}
   
end