require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  describe '#initialize' do
    let(:comment) { FactoryBot.create(:comment) }
    let(:task) { comment.task }
    let(:project) { task.project }
    let(:user) { project.user }
    subject { Ability.new(user) }

    it { should be_able_to(:manage, project) }
    it { should be_able_to(:manage, task) }
    it { should be_able_to(:manage, comment) }
  end
end
