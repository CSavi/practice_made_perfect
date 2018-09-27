class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name, :category

  has_many :lessons
  has_many :students, through: :lessons 

  has_many :assignments
end
