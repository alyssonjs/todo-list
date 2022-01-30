FactoryBot.define do
  factory :todo_list do
    title { Faker::Alphanumeric.alphanumeric(number: 22) }
    position { Faker::Number.non_zero_digit }
  end
end
