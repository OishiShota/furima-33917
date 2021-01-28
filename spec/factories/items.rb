FactoryBot.define do
  factory :item do
    product_name        {Faker::Lorem.sentence}
    product_description {Faker::Lorem.sentence}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    category_id         {Faker::Number.between(from: 2, to: 7)}
    state_id            {Faker::Number.between(from: 2, to: 48)}
    shipping_cost_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    preparation_time_id {Faker::Number.between(from: 2, to: 4)}
    image               {Faker::Lorem.sentence}
    
    association :user
  end
end