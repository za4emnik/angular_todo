class Task < ApplicationRecord
  include AASM

  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :name, :aasm_state, presence: true

  aasm do
    state :in_process, initial: true
    state :completed

    event :complete do
      transitions from: :in_process, to: :completed
    end

    event :to_process do
      transitions from: :completed, to: :in_process
    end
  end
end
