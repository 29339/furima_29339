FactoryBot.define do
  factory :user_order do
    token { '加藤' }
    post_number { '150-0034' }
    shipping_address_id { '3' }
    address { '横浜市' }
    address_number { '18-10' }
    phone_number { '08015599188' }
  end
end
