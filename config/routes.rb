Rails.application.routes.draw do
  get "/template/login" => "template#login"
  get "/template/new_feed" => "template#new_feed"
  get "/template/new_feed_people_nearby" => "template#new_feed_people_nearby"
  get "/template/new_feed_friends" => "template#new_feed_friends"
  get "/template/new_feed_messages" => "template#new_feed_messages"
  get "/template/timeline" => "template#timeline"
  get "/template/timeline_about" => "template#timeline_about"
  get "/template/timeline_album" => "template#timeline_album"
  get "/template/timeline_friends" => "template#timeline_friends"
end
