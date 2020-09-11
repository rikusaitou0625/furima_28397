FactoryBot.define do
  factory :adress_orders do
    token {'PAYJP_PUBLIC_KEY'}
    post_number { '810-0022' }
    prefecture                { '40' }
    city         { '福岡' }
    adress { '福岡'}
    phone_number     { '09012345678' }
   
  end
end
