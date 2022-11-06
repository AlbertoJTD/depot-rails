Rails.application.routes.draw do
  resources :users
  scope "(:locale)", defaults: {locale: 'en'}, locale: /en|es/  do
    # scope "/:locale", defaults: {locale: 'en'}, constraints: {locale: /en | es/ } do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index'
    resources :products

    resources :products do
      get :who_bought, on: :member
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
