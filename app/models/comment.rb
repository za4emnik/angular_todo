class Comment < ApplicationRecord
  belongs_to :task
  validates :message, presence: true

  mount_uploader :attachment, AttachmentUploader
end
