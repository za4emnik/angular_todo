class Comment < ApplicationRecord
  belongs_to :task
  validates :message, presence: true
  validates :message, length: { minimum: 10, maximum: 256 }

  mount_base64_uploader :attachment, AttachmentUploader
end
