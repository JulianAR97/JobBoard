Rails.application.routes.draw do
  devise_for :users
  
  # scope in this instance is the same as saying resources :users except: *methods
  # listings need to be nested under a user to perform crud actions
  scope '/users/:user_id' do
    resources :listings, as: :user_listings
  end

  # allow all users to look at the listings regardless of session status
  resources :listings, only: %i[index show]

  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
