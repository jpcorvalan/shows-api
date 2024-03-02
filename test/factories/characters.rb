FactoryBot.define do
  factory :character do
    image { Faker::Avatar.image }
    name { Faker::FunnyName.name }
    age { Faker::Number.number(digits: 2) }
    weight { Faker::Number.positive(from: 1.00, to: 100.00) }
    history { Faker::Lorem.paragraph(sentence_count: 10) }
  end
end
