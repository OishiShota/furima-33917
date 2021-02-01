FactoryBot.define do
  factory :address do
    postal_code   {Faker::Name.first_name}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Faker::Number.between(from: 300, to: 9999999)}
    block         {Faker::Number.between(from: 2, to: 11)}
    building      {Faker::Number.between(from: 2, to: 7)}
    tel           {Faker::Number.between(from: 2, to: 3)}
    association :order
  end
end