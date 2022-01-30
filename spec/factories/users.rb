FactoryBot.define do
  factory :user do
    name { Faker::Code.imei }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 5) }
  end
end
