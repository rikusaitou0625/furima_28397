FactoryBot.define do
  factory :item do
    name { '田中' }
    info                { '田中' }
    category_id         { 1 }
    items_status_id     { 1 }
    shipping_fee_id     { 1 }
    prefecture_id       { 1 }
    scheduled_delivery_id { 1 }
    price { 3000 }
    user
    #  image
  end
end
