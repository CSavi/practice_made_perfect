class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :lesson_id
  
    belongs_to :lesson
  end
  