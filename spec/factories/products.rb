# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :product do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    image_url { Faker::LoremFlickr.image(search_terms: ['book']) }
    price { Faker::Commerce.price(range: 1..100) }
  end
end
