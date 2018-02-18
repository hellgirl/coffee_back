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

  devise_for :admin_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
