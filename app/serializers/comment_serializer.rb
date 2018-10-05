class CommentSerializer < ActiveModel::Serializer
    attributes :id, :description, :lesson_id
  
    belongs_to :lesson
  end
  