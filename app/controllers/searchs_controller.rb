class SearchsController < ApplicationController
  include TransactionsHelper
  before_action :check_login

  def index
    here_local = current_user.local
    local_nearbys = here_local.nearbys(50)
    @users = [];
    @my_transaction = current_user.local
    local_nearbys.each do |local|
      user = local.user
      if user.present?
        birthday = user.birthday
        if birthday&.birthday.present?
          if check_user(birthday, "male", 30, 1)
            @users.push user
          end
        end
      end
    end
  end

  def create
    here_local = current_user.local
    local_nearbys = here_local.nearbys(50)
    @users = [];
    @my_transaction = current_user.local
    local_nearbys.each do |local|
      user = local.user
      if user.present?
        birthday = user.birthday
        if birthday&.birthday.present?
          if check_params birthday
            @users.push user
          end
        end
      end
    end
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
    # binding.pry
    (u.genre == params[:search][:genre]) && (age(birthday.birthday) <= params[:search][:age_max].to_i) && (age(birthday.birthday) >= params[:search][:age_min].to_i) ? true : false
  end
end
