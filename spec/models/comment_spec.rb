require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:task) }
  end

  describe 'validations' do
    it { should validate_presence_of(:message) }
  end
end
