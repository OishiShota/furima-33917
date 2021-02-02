FactoryBot.define do
  factory :address_order do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {3.times.map { SecureRandom.random_number(10) }.join + "-" + 4.times.map { SecureRandom.random_number(10) }.join}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {"江東区豊洲1丁目"}
    block         {"1番地1号"}
    building      {"高層マンション1001"}
    tel           {10.times.map { SecureRandom.random_number(10) }.join}
  end
end