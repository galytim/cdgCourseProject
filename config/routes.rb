Rails.application.routes.draw do
  devise_for :users 

  resources :profiles, only: [:index, :show]
  post 'follow/:id', to: 'profiles#follow', as: :follow

  root "posts#index"
  resources :posts do
    member do
      post 'like'
    end
    resources :comments, only: [:create, :destroy]
  end

 
end
