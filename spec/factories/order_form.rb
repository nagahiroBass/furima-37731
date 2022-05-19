FactoryBot.define do
  factory :order_form do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { Faker::Address.city }
    house_number  { Faker::Address.building_number }
    building_name { 'hogeビル' }
    phone_number  { '09012345678' }
  end
end
