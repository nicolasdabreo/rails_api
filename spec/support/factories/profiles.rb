# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { Faker::Gender.type }
    rating { 1000 }
    nickname { Faker::Superhero.name }
    bio { Faker::Lorem.sentence }
    telephone { Faker::PhoneNumber.phone_number }
    account
  end
end
