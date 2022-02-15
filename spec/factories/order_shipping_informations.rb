FactoryBot.define do
  factory :order_shipping_information do
    post_code        { '123-4567' }
    prefectures_id   { 2 }
    municipalities   { '札幌市' }
    address          { '123' }
    telephone_number { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
