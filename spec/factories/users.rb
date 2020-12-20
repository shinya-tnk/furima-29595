FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.initials(number: 3) }
    email { Faker::Internet.free_email }
    password { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3) }
    password_confirmation { password }
    family_name { person.last.kanji }
    first_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birthday { Faker::Date.backward }
  end
end
