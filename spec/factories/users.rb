FactoryBot.define do
  factory :user do
    nickname              { 'kato' }
    email                 { '86@gmail.com' }
    password              { 'AARK2088' }
    password_confirmation { 'AARK2088' }
    first_name            { '加藤' }
    last_name             { '加藤' }
    first_name_kana       { 'カトウ' }
    last_name_kana        { 'カトウ' }
    birth_day             { '1930-01-01' }
  end
end
