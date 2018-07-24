class SessionsController < ApplicationController
  def new; end

  def create
    email = Email.find_by email: params[:session][:email].downcase
    user = email.user
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = t(".danger")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
