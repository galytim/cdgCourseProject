Rails.application.routes.draw do
  devise_for :users 

  root "profiles#feed"

  resources :profiles, only: [:index, :show]
  post "follow/:id", to: "profiles#follow", as: :follow
  get "feed", to: "profiles#feed", as: :feed 
  
 
  post "like/:id", to: "likes#like", as: :like 
  get "/posts/:id/comments/:id", to:"comments#destroy"
  resources :posts do
    
    resources :comments, only: [:create, :destroy]
    
  end

 
end
