require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(domain: 'gmail.com') }
    password { Faker::Internet.password + 'A##1' }
  end
end
