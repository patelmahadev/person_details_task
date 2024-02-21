require 'faker'
FactoryBot.define do
  factory :person do
    email {"#{Faker::Internet.email}"}
    name { "#{Faker::Name.name}" }
  end
end