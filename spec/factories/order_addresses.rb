FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Address.postcode }
    prefecture_id { 2 }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { Faker::PhoneNumber.cell_phone.gsub(/-/, '') }
    token { Faker::Lorem.characters }
    user_id { 1 }
    item_id { 1 }
  end
end
