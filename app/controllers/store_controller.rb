class StoreController < ApplicationController
  skip_before_action :authorize
  
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

    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
