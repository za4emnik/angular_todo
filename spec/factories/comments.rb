require 'ffaker'

FactoryBot.define do
  factory :comment do
    message { FFaker::Book.title }
    remote_attachment_url { FFaker::Avatar.image }
    association :task
  end
end
