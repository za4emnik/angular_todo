require 'ffaker'

FactoryBot.define do
  factory :task do
    name { FFaker::Book.title }
    deadline { FFaker::Time.datetime }
    position { rand(1..100) }
    association :project
  end
end
