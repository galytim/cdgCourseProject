Rails.application.routes.draw do
  devise_for :users
  
  root "posts#index"
  resources :posts do
    resources :likes
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
