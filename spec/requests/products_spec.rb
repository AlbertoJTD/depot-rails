require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }

  before do
    # Log in as the created user
    post login_url, params: { name: user.name, password: 'secret123' }
    follow_redirect! if response.redirect?
  end

  describe 'GET /products' do
    it 'returns a success response' do
      get products_path(locale: 'en')
      expect(response).to be_successful
    end
  end

  describe 'GET /products/:id' do
    it 'returns a success response' do
      product = Product.create!(title: 'My Book Title', description: 'yyy', image_url: 'logo.png', price: 1)

      get product_path(product)
      expect(response).to be_successful
    end
  end

  describe 'GET /products/new' do
    it 'returns a success response' do
      get new_product_path(locale: 'en')

      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to be_successful
    end
  end

  describe 'POST /products' do
    it 'creates a new product' do
      params = { product: { title: 'My Book Title', description: 'yyy', image_url: 'logo.png', price: 1 } }

      expect {
        post products_path(locale: 'en'), params: params
      }.to change(Product, :count).by(1)
    end
  end

  describe 'PUT /products/:id' do
    it 'updates a product' do
      product = Product.create!(title: 'My Book Title', description: 'yyy', image_url: 'logo.png', price: 1)

      # Initialize the session counter
      get store_index_path(locale: 'en')

      put product_path(product), params: { product: { title: 'My Book Title 2' } }
      expect(response).to redirect_to(product_path(product))
      expect(product.reload.title).to eq('My Book Title 2')
    end
  end

  describe 'GET /products/:id/edit' do
    it 'returns a success response' do
      product = Product.create!(title: 'My Book Title', description: 'yyy', image_url: 'logo.png', price: 1)

      get edit_product_path(product)
      expect(response).to be_successful
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'GET /products/:id/edit' do
    it 'returns a 404 if the product does not exist' do
      expect {
        get edit_product_path(id: -1)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
