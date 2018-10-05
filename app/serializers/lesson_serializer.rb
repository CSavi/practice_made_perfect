class LessonSerializer < ActiveModel::Serializer
  attributes :id, :count, :lesson_datetime, :student_id, :instructor_id

  belongs_to :instructor
  belongs_to :student 
  has_many :comments
end
