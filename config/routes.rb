Rails.application.routes.draw do
  root :to => "template#new_feed"
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
  get "/template/timeline" => "template#timeline"
  get "/template/timeline_about" => "template#timeline_about"
  get "/template/timeline_album" => "template#timeline_album"
  get "/template/timeline_friends" => "template#timeline_friends"
  get "posts/new"
  root "users#new"
  resources :blogs
  resources :users
  resources :reports, only: [:create]

  mount ActionCable.server => "/cable"
  resources :conversations do
    resources :messages, only: [:index, :new, :create]
  end

  get "talk", to: "strangers#index"
  post "talk", to: "strangers#talk"
  post "find", to: "strangers#find"
  post "find_stranger", to: "strangers#find_stranger"
  resources :comments
  resources :transactions, only: %i(index create)

  get "admin", to: "admin#reported"
  get "admin/reported", to: "admin#reported"
end
