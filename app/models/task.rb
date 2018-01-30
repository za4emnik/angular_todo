class Task < ApplicationRecord
  include AASM

  before_create :set_deadline

  belongs_to :project
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  acts_as_list scope: :project

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

  def set_deadline
    self.deadline = (DateTime.tomorrow + 10.hours).iso8601
  end
end
