FactoryBot.define do
  factory :item do
    product_name        {Faker::Name.first_name}
    product_description {Faker::Lorem.sentence}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    state_id            {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    preparation_time_id {Faker::Number.between(from: 2, to: 4)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end