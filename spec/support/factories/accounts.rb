# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { Faker::Internet.email }
  end
end
