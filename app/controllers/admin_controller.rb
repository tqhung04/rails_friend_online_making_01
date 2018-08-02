class AdminController < ApplicationController
  before_action :logged_in_user, :isAdmin?, only: %i(show_all_reports show_unique_reports show)

  def show_all_reports
    @be_reported_users = Report.join_with_user.select_report.page(params[:page]).per Settings.pagination.report
  end

  def show_unique_reports
    @be_reported_users = Report.get_unique_reported.page(params[:page]).per Settings.pagination.report
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

  def show
    @report = Report.get_unique_reported.where_reported_id(params[:id]).page(params[:page]).per Settings.pagination.report
  end

  private

  def isAdmin?
    return if current_user.admin?
    redirect_to login_path
  end
end
