Rails.application.routes.draw do
  namespace :admin do
    resources :admin_users
    resources :users
    resources :drinks
    resources :volumes
    resources :drinks_volumes
    resources :drink_additions
    resources :drink_sub_additions
    resources :coffee_shops

    root to: "admin_users#index"
  end

  devise_for :admin_users, skip: [:registrations]
  devise_for :staff_users, skip: [:registrations]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :drinks, only: :index, defaults: { format: :json }
      resources :drink_additions, only: :index, defaults: { format: :json }
      resources :drink_sub_additions, only: :index, defaults: { format: :json }
      resources :coffee_shops, only: :index, defaults: { format: :json }
    end
  end
end
