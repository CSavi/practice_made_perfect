class Student < ActiveRecord::Base

    has_many :lessons
    has_many :instructors, through: :lessons 

    validates :name, presence: true 
    validates :category, presence: true 
    validates :level, presence: true 

    scope :highest_level, -> { where("students.level =='Advanced'")}
    scope :moderate_level, -> { where("students.level =='Moderate'")}
    scope :beginner_level, -> { where("students.level =='Beginner'")}

    # scope :next, lambda {|id| where("id > ?", id).order("id ASC")}
    # scope :previous, lambda {|id| where("id < ?", id).order("id DESC")}



    # def next
    #     Student.offset(self.id).first 
    #     binding.pry
    # end 

    # def previous 
    #     Student.offset(self.id).first
    # end 

    # def next
    #     self.class.where("id > ?", id).first
    # end
    
    # def previous
    #     self.class.where("id < ?", id).last
    # end
    

end 