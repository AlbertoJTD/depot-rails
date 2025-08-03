# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
    pay_type { %w[Check CreditCard PurchaseOrder].sample }
  end
end
