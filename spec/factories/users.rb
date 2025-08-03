# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password { 'secret123' }
    password_confirmation { 'secret123' }
  end
end
