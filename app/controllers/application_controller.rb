class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def rights_delete object, user
    return if object.user_id == user.id || user.admin?
    redirect_to object
  end

  def rights_update object, user
    return if object.user_id == user.id
    redirect_to object
  end

  def logged_in_user
    return if logged_in?
    redirect_to login_url
  end
end
