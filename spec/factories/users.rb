FactoryBot.define do
  factory :user do
    nickname             {'test'}
    email                {Faker::Internet.free_email}
    password             {'test012'}
    password_confirmation {'test012'}
    last_name            {'山田'}
    first_name           {'太郎'}
    last_name_kana       {'ヤマダ'}
    first_name_kana      {'タロウ'}
    birth_day            {'1980-01-01'}
  end
end