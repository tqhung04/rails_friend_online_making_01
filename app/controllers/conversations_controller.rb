class ConversationsController < ApplicationController
  before_action :logged_in_user, :get_current_conversation, :allowed?,
    :get_conversations, :get_last_messages, only: %i(show)

  def index; end

  def show
    @messages = Message.message_asc.where conversation_id: params[:id]
  end

  private

  def allowed?
    return if @current_conversation.sender == current_user ||
      @current_conversation.recipient == current_user

    redirect_to root_url
  end

  def get_conversations
    @conversations = Conversation.get_all(current_user.id)
  end

  def get_current_conversation
    @current_conversation = Conversation.find_by id: params[:id]

    redirect_to root_url if @current_conversation.nil?
  end

  def get_last_messages
    @last_messages = []
    @conversations.each do |conversation|
      @last_messages << conversation.messages.where.not(user_id: current_user.id).last
    end
  end
end
