class StrangersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{params[:user_id]}"
  end
end
