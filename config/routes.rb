Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  scope '(:locale)'  do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index'
    resources :products
    resources :products do
      get :who_bought, on: :member
    end
  end
end
