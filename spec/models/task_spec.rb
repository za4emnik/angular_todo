require 'rails_helper'
require 'aasm/rspec'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:aasm_state) }
  end

  describe 'change of states' do
    it { expect(subject).to transition_from(:in_process).to(:completed).on_event(:complete) }
    it { expect(subject).to transition_from(:completed).to(:in_process).on_event(:to_process) }
  end
end
