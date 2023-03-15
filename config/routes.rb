Rails.application.routes.draw do
  devise_for :users 

  resources :profiles, only: [:index, :show]
  post "follow/:id", to: "profiles#follow", as: :follow
  get "feed", to: "profiles#feed", as: :feed
  get "/posts/:id/comments/:id", to:"comments#destroy"
  root "profiles#feed"
  resources :posts do
    member do
      post 'like'
    end
    
    resources :comments, only: [:create, :destroy]
    
  end

 
end
