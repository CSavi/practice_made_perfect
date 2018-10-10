class Instructor < ActiveRecord::Base
   

    has_many :lessons
    has_many :students, through: :lessons 

    has_many :assignments

    has_secure_password

    validates :name, presence: true 
    validates :name, length: { minimum: 2 }
   
    validates :password, presence: true 
    validates :password, length: {minimum: 2 }

    #instance method for instructors#show
    def students_scheduled
        self.lessons.size
    end 

    def self.find_or_create_by_omniauth(auth_hash)
        self.find_or_create_by(uid: auth_hash[:uid]) do |instructor|
            instructor.password = SecureRandom.hex
            instructor.name = auth_hash[:info][:name]
        end 
    end 
   
end 