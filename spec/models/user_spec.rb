require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:projects) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }

    it { should allow_value('test@domain.com').for(:email) }
    it { should_not allow_value('testdomain.com').for(:email) }
    it { should_not allow_value('te#st@domain.s').for(:email) }

    it { should_not allow_value('pasS2wo').for(:password) }
    it { should allow_value('passwordS1').for(:password) }
    it { should allow_value('pas5Tsa1').for(:password) }
  end
end
