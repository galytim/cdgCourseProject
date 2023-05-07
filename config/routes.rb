Rails.application.routes.draw do
  devise_for :users 

  root "profiles#feed"

  resources :profiles, only: [:index, :show]
  
  get "feed", to: "profiles#feed", as: :feed 
  
  post "follow/:id", to: "follows#follow", as: :follow
  post "like/:id", to: "likes#like", as: :like 
  get "/posts/:id/comments/:id", to:"comments#destroy"
  resources :posts, only: [:new, :create, :show, :destroy, :update, :edit] do
    
    resources :comments, only: [:create, :destroy]
    
  end

 
end
