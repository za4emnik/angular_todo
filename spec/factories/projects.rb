require 'ffaker'

FactoryBot.define do
  factory :project do
    name { FFaker::Book.title }
    association :user
  end
end
