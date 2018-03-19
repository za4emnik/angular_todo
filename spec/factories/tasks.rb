require 'ffaker'

FactoryBot.define do
  factory :task do
    name { FFaker::Book.title }
    deadline { (DateTime.tomorrow + 10.hours).iso8601 }
    association :project
  end
end
