Rails.application.routes.draw do
  root :to => "blogs#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/template/login" => "template#login"
  get "/template/new_feed" => "template#new_feed"
  get "/template/new_feed_people_nearby" => "template#new_feed_people_nearby"
  get "/template/new_feed_friends" => "template#new_feed_friends"
  get "/template/new_feed_messages" => "template#new_feed_messages"
  get "/template/new_feed_find_people" => "template#new_feed_find_people"
  post "/template/new_feed_find_people" => "template#new_feed_find_people"
  get "/template/timeline" => "template#timeline"
  get "/template/timeline_about" => "template#timeline_about"
  get "/template/timeline_album" => "template#timeline_album"
  get "/template/timeline_friends" => "template#timeline_friends"
  get "/users/:id/show_public", to: "users#show_public", as: :show_public
  get "/users/:id/show_private", to: "users#show_private"
  get "/users/:id/show_desire", to: "users#show_desire"
  get "/users/:id/timeline_friends", to: "users#timeline_friends", as: :timeline_friends
  get "posts/new"
  root "users#new"
  resources :blogs
  resources :users
  resources :conections, only: %i(create update destroy)
  resources :reports
  resources :searchs
  resources :complaints

  mount ActionCable.server => "/cable"
  resources :conversations do
    resources :messages, only: %i(index new create)
  end

  get "talk", to: "strangers#index"
  post "talk", to: "strangers#talk"
  post "find", to: "strangers#find"
  post "find_stranger", to: "strangers#find_stranger"
  resources :comments
  resources :transactions, only: %i(index create)

  namespace :admin do
    resources :reports
    resources :complaints
    resources :users, only: %i(index)
    get "unique_reports", to: "reports#show_unique_reports"
  end
end
