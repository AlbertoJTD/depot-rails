class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title) #Display the products in alphabetical order
    if session[:counter].nil?
      session[:counter] = 0
      puts "El valor es de: #{session[:counter]}"
    else
      session[:counter] += 1
    end
  end
end
