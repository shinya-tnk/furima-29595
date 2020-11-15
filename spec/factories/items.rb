FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 300..9_999_999) }
    category_id { 2 }
    item_condition_id { 2 }
    postage_type_id { 2 }
    prefecture_id { 2 }
    preparation_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
