Rails.application.routes.draw do
  get "/template/login" => "template#login"
  get "/template/new_feed" => "template#new_feed"
end
