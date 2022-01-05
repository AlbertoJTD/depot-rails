class StoreController < ApplicationController
  def index
    @products = Product.order(:title) #Display the products in alphabetical order
  end
end
