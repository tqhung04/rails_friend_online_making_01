class AdminController < ApplicationController
  before_action :logged_in_user, :isAdmin?, only: %i(reported)

  def reported
    @be_reported_users = Report.join_with_users.page(params[:page]).per(Settings.pagination.report)
    status = params["status"]
    order = params["order"]

    if status == "blocked"
      @be_reported_users = @be_reported_users.where("isBlocked = true");
    elsif status == "available"
      @be_reported_users = @be_reported_users.where("isBlocked = false");
    end

    if order == "asc"
      @be_reported_users = @be_reported_users.order("COUNT(reports.reported_id) ASC");
    elsif order == "desc"
      @be_reported_users = @be_reported_users.order("COUNT(reports.reported_id) DESC");
    end
  end
  private

  def isAdmin?
    return if current_user.admin?
    redirect_to login_path
  end
end
