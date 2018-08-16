class Assignment < ActiveRecord::Base

    belongs_to :instructor

    validates :title, presence: true 
    validates :lesson_hours, presence: true 
    validates :lesson_hours, numericality: true
    validates :lesson_planning_hours, presence: true 
    validates :lesson_planning_hours, numericality: true 
    
end