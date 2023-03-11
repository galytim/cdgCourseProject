Rails.application.routes.draw do
  devise_for :users 
  resources :profiles, only: [:index, :show]
  # Follow path
  post 'follow/:id', to: 'follows#follow', as: :follow
  # Unfollow path
  post 'unfollow/:id', to: 'follows#unfollow', as: :unfollow

  root "posts#index"
  resources :posts do
    member do
      put 'like'
    end
    resources :comments, only: [:create, :destroy]
  end

 
end
