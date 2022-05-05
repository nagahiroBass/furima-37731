FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Commerce.department }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    price { 300 }

    association :user
  end
end
