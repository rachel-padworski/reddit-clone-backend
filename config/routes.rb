Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :comments 
      end
      resources :posts do
        resources :comments
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
