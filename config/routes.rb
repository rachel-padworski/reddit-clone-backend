Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: "sessions#login"
      post '/autologin', to: "sessions#autologin"
      resources :users
      resources :posts 
      resources :comments
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
