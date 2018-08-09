class SearchsController < ApplicationController
  include TransactionsHelper
  before_action :check_login

  def index
    here_local = current_user.local
    @users = User.join_with_transaction_and_birthday.
      check_birthday(get_date_from_age(Settings.matching.max_age), get_date_from_age(Settings.matching.min_age)).
      check_position(Settings.matching.rad, current_user.local.latitude, current_user.local.longitude)
  end

  def create
    here_local = current_user.local
    @users = User.join_with_transaction_and_birthday.
      check_genre(params[:search][:genre] == "male" ? 0 : 1).
      check_birthday(get_date_from_age(params[:search][:age_max].to_i), get_date_from_age(params[:search][:age_min].to_i)).
      check_position(Settings.matching.rad, current_user.local.latitude, current_user.local.longitude)
  end

  private
  def check_login
    return if logged_in?
    redirect_to root_url
  end

  def age dob
    now = Time.now.utc.to_date
    t = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    t.to_i
  end

  def check_user(birthday, genre, max_age, min_age)
    u = birthday.user
    (u.genre != current_user.genre) && (age(birthday.birthday) <= max_age) && (age(birthday.birthday) >= min_age) ? true : false
  end

  def check_params birthday
    u = birthday.user
    (u.genre == params[:search][:genre]) && (age(birthday.birthday) <= params[:search][:age_max].to_i) && (age(birthday.birthday) >= params[:search][:age_min].to_i) ? true : false
  end

  def get_date_from_age age
    Time.new(Time.now.year - age.to_i, 1 ,1)
  end
end
