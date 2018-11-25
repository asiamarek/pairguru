FactoryBot.define do
  factory :user do
    email { "example@example.com" }
    name { Faker::Lorem.word }
    password { "examplepassword" }
    password_confirmation  { "examplepassword" }
  end
end
