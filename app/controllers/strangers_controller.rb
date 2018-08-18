class StrangersController < ApplicationController
  before_action :check_blocked_user, :logged_in_user, only: %i(index find_stranger talk)
  before_action :turn_off_matching, only: %i(index)

  def index
    @user = current_user
  end

  def find_stranger
    # Turn on matching
    current_user.turn_on_matching
    # Find matching on stranger
    @stranger = User.where(matching: true).where.not(id: current_user.id).first
    # Notice to owner when stranger join
    if @stranger.present?
      current_user.turn_off_matching
      ActionCable.server.broadcast "user_#{@stranger.id}", matching: true
      # Turn off matching for participant
    end
    # Listen stream
    respond_to do |format|
      format.js {}
    end
  end

  def talk
    isSystem = params.require(:message)[:isSystem]
    stream_of = params.require(:message)[:stream_of]
    @message = Message.new message_params
    # Turn off matching for owner
    if isSystem
      user = User.find @message.user_id
      user.turn_off_matching
    end
    @message_for_sender = render_to_string(
      template: "strangers/_message",
      locals: {message: @message, talking_with_stranger: true},
      layout: false
    )

    @message_for_recipient = render_to_string(
      template: "strangers/_message_recipient",
      locals: {message: @message, talking_with_stranger: true},
      layout: false
    )

    ActionCable.server.broadcast "user_#{stream_of}",
      sender_id: isSystem ? 0 : current_user.id,
      body: @message.body,
      message_for_recipient: @message_for_recipient,
      message_for_sender: @message_for_sender

    respond_to do |format|
      format.js {}
    end
  end

  private

  def get_stranger
    @stranger = User.where(matching: true).where.not(id: current_user.id).first
  end

  def message_params
    params.require(:message).permit(:user_id, :body, :created_at)
  end

  def turn_off_matching
    current_user.turn_off_matching
  end
end
