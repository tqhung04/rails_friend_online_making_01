class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all.ordered_by_created_at.page(params[:page]).per Settings.pagination.user
  end
end
