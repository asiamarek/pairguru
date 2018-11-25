FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    name { Faker::Lorem.word }
    password { "examplepassword" }
    password_confirmation { "examplepassword" }
  end
end
