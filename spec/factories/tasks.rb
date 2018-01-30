require 'ffaker'

FactoryBot.define do
  factory :task do
    name { FFaker::Book.title }
    deadline { Time.at(1.day.from_now.to_i - (1.day.from_now.to_i % 30.minutes)).to_time.iso8601 }
    association :project
  end
end
