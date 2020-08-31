FactoryBot.define do
  factory :user do
    name                  { '田中' }
    email                 { Faker::Internet.free_email }
    password              { 'abcd1234' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { '1990-06-25' }
  end
end
