class Student < ActiveRecord::Base

    has_many :lessons
    has_many :instructors, through: :lessons 
    belongs_to :instructor
    scope :next, lambda {|id| where("id > ?", id).order("id ASC")}
    # default_scope { order('id DESC')}
    scope :previous, lambda {|id| where("id < ?", id).order("id DESC")}

    validates :name, presence: true 
    validates :category, presence: true 
    validates :level, presence: true 

    scope :highest_level, -> { where("students.level =='Advanced'")}
    scope :moderate_level, -> { where("students.level =='Moderate'")}
    scope :beginner_level, -> { where("students.level =='Beginner'")}



    def next
        instructor.student.next(self.id).first 
    end 

    def previous 
        instructor.student.previous(self.id).first
    end 

end 