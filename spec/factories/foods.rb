FactoryBot.define do
  factory :food do
    name                  { Faker::Commerce.product_name }
    price                 { Faker::Commerce.price(range: 1000..9_999_999) }
    description           { Faker::Lorem.sentence }
    genre_id              { Faker::Number.between(from: 2, to: 7) }
    drink_id              { Faker::Number.between(from: 2, to: 8) }
    scene_id              { Faker::Number.between(from: 2, to: 6) }
    allergy_id            { Faker::Number.between(from: 2, to: 10) }
    day_id                { Faker::Number.between(from: 2, to: 4) }
    association :user
  end
end
