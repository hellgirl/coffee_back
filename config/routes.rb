Rails.application.routes.draw do
  namespace :admin do
    resources :admin_users
    resources :users
    resources :drinks
    resources :volumes
    resources :drinks_volumes
    resources :drink_additions
    resources :coffee_shops
    resources :drink_categories

    root to: "drinks#index"
  end

  devise_for :admin_users, skip: [:registrations]
  devise_for :staff_users, skip: [:registrations]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :staff do
    resources :orders, only: :index
    resource :prepare_drink, only: :create
    resource :break, only: :create, controller: :break
    resource :notification_tokens, only: :create
  end

  namespace :api do
    mount_devise_token_auth_for "User", at: "auth"
    namespace :v1 do
      resources :drinks, only: :index, defaults: { format: :json }
      resources :drink_additions, only: :index, defaults: { format: :json }
      resources :coffee_shops, only: :index, defaults: { format: :json }
      resources :orders, only: %i(index show create), defaults: { format: :json }
      resources :payment_cards, only: :index, defaults: { format: :json }
      resources :drink_categories, only: :index, defaults: { format: :json }
    end
  end

  resource :payments, only: :create

  get "/", :to => redirect('/about-us.html')
end
