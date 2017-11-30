class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :attachment
end
