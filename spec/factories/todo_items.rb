FactoryBot.define do
  factory :todo_item do
    description { Faker::Alphanumeric.alphanumeric(number: 22) }
    position { Faker::Number.non_zero_digit }
    completed { Faker::Boolean.boolean }
    completed_at { Time.now }
  end
end
