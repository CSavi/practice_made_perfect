class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :level

  has_many :lessons
  has_many :instructors, through: :lessons 
end

 