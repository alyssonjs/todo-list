FactoryBot.define do
  factory :category do
    name { Faker::Code.imei }
  end
end
