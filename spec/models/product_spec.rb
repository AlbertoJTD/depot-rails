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
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    context 'valid' do
      it 'with title, description, image_url, and price' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)

        expect(product).to be_valid
      end

      it 'with a price greather than or equal to 0.01' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 0.01)
        expect(product).to be_valid

        product.price = 1
        expect(product).to be_valid

        product.price = 10
        expect(product).to be_valid
      end

      it 'with a valid image_url' do
        %w[gif jpg png jpeg].each do |image_url|
          product = Product.new(title: 'My Book Title', description: 'yyy', image_url: "image_#{rand(1000)}.#{image_url}", price: 1)
          expect(product).to be_valid
        end
      end

      it 'with a title of a minimun of 10 characters' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        expect(product).to be_valid
      end
    end

    context 'invalid' do
      it 'without a title' do
        product = Product.new(description: 'yyy', image_url: 'zzz.jpg', price: 1)

        expect(product).to be_invalid
        expect(product.errors[:title]).to include("can't be blank")
      end

      it 'without a description' do
        product = Product.new(title: 'My Book Title', image_url: 'zzz.jpg', price: 1)

        expect(product).to be_invalid
        expect(product.errors[:description]).to include("can't be blank")
      end

      it 'without an image_url' do
        product = Product.new(title: 'My Book Title', description: 'yyy', price: 1)

        expect(product).to be_invalid
        expect(product.errors[:image_url]).to include("can't be blank")
      end

      it 'without a price' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg')

        expect(product).to be_invalid
        expect(product.errors[:price]).to include("can't be blank")
        expect(product.errors[:price]).to include('is not a number')
      end

      it 'with a price less than 0.01' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 0.00)
        expect(product).to be_invalid

        product.price = -1
        expect(product).to be_invalid

        product.price = -1000
        expect(product).to be_invalid
        expect(product.errors[:price]).to include('must be greater than or equal to 0.01')
      end

      it 'with a duplicated title' do
        product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        product.save!

        product2 = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        expect(product2).to be_invalid
        expect(product2.errors[:title]).to include('has already been taken')
      end

      it 'with a non-URL image_url' do
        %w[not_a_url.foo not_a_url.bar xlsx pdf md].each do |image_url|
          product = Product.new(title: 'My Book Title', description: 'yyy', image_url: "image_#{rand(1000)}.#{image_url}", price: 1)
          expect(product).to be_invalid
          expect(product.errors[:image_url]).to include('Must be a URL for GIF, JPG, JPEG or PNG image.')
        end
      end

      it 'with a title of less than 10 characters' do
        product = Product.new(title: 'Hello', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        expect(product).to be_invalid
        expect(product.errors[:title]).to include('is too short (minimum is 10 characters)')
      end
    end
  end

  describe 'destroy' do
    context 'without line items' do
      it 'destroys the product' do
        product = Product.create!(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        expect { product.destroy }.to change(Product, :count).by(-1)
      end
    end

    context 'with line items' do
      it 'cannot destroy the product' do
        product = Product.create!(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg', price: 1)
        line_item = LineItem.create!(product: product, quantity: 1)

        expect(product.destroy).to be_falsey
        expect { product.destroy }.to change(Product, :count).by(0)
        expect(product.errors[:base]).to include('Line Items present')
      end
    end
  end
end
