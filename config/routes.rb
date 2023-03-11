Rails.application.routes.draw do
  devise_for :users 
  resources :users, only: [:index, :show]
  root "posts#index"
  resources :posts do
    member do
      put 'like'
    end
    resources :comments, only: [:create, :destroy]
  end

 
end
