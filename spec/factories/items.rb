FactoryBot.define do
  factory :item do
    name                { '加藤' }
    story               { '加藤でう' }
    category_id         { '2' }
    status_id           { '2' }
    delivery_fee_id     { '2' }
    shipping_address_id { '3' }
    delivery_date_id    { '2' }
    price               { '300' }
    association :user
  end
end
