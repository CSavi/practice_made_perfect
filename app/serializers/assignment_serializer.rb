class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :lesson_hours, :lesson_planning_hours, :created_at, :updated_at, :instructor_id

  belongs_to :instructor
end
