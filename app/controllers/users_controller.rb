class UsersController < ApplicationController
  before_action :correct_user, only: %i(show)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @email = @user.build_email email_params
      if @email.save
        log_in @user
        flash[:success] = t("success")
        redirect_to @user
      else
        @user.destroy
        render :new
      end
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to request.referrer || root_url
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("success")
    else
      flash[:warning] = t("error")
    end
    redirect_to users_url
  end

  private
  def correct_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end

  def email_params
    params.require(:user).permit Email::ATTRIBUTES_PARAMS
  end

  def logged_in_user
    return if logged_in?
    store_location
    redirect_to login_url
  end
end
