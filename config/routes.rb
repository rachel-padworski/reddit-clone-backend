Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users do
      #   resources :comments 
      # end
      resources :users
      resources :posts 
      resources :comments
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
