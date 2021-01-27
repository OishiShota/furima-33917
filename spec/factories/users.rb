FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 4)+"a1"}
    password_confirmation {password}
    first_name            {person.first.kanji}
    last_name             {person.last.kanji}
    first_kana            {person.first.katakana}
    last_kana             {person.last.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-01-01')}
  end
end