class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :deadline, :position, :aasm_state
end
