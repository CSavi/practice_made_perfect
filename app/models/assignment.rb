class Assignment < ActiveRecord::Base

    belongs_to :instructor

    validates :title, presence: true 
    validates :lesson_hours, numericality: true
    validates :lesson_planning_hours, numericality: true 

    scope :most_lesson_hours, -> { order("assignments.lesson_hours DESC")}
    scope :most_lesson_planning_hours, -> { order("assignments.lesson_planning_hours DESC")}
    scope :recently_created, -> { order("assignments.created_at DESC")}
    scope :recently_updated, -> { order("assignments.updated_at DESC")}
    
end