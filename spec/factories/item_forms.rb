FactoryBot.define do
  factory :item_form do
    name { Faker::Commerce.product_name }
    explanation { Faker::Commerce.department }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    price { 300 }
    user_id {1}
    image { 1 }

    # association :user
    # after(:build) do |item_form|
    #   item_form.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.pmg', content_type: 'image/png')
    # end
  end
end
