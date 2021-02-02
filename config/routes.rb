Rails.application.routes.draw do
  devise_for :users 
  
  # Technically correct, but fix these routes
  resources :users, except: [:index, :show, :edit, :update, :destroy, :new, :create] do
    resources :listings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
