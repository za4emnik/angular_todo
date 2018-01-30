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

  describe '#set_deadline' do
    let(:task) { FactoryBot.create(:task) }

    it 'deadline should be set on the next day' do
      task_date = task.deadline.to_time.utc.strftime("%Y-%m-%d")
      tomorrow = Time.at(1.day.from_now).utc.strftime( "%Y-%m-%d" )
      expect(task_date).to eq(tomorrow)
    end

    it 'deadline should be rounded to 30 minutes' do
      remainder = (task.deadline.to_time.utc.strftime("%M")).to_i % 30
      expect(remainder).to eq(0)
    end
  end
end
