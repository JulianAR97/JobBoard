Rails.application.routes.draw do
  devise_for :users 
  
  # Technically correct, but fix these routes
  scope '/users/:user_id' do
    resources :listings
  end

  resources :listings, only: :index

  root 'listings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
