class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :attachment, :created_at
end
