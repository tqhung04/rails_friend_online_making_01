class Admin::ReportsController < Admin::AdminController

  def index
    @be_reported_users = Report.join_with_user.select_report.page(params[:page]).per Settings.pagination.report
  end

  def show
    @report = Report.get_unique_reported.where_reported_id(params[:id]).page(params[:page]).per Settings.pagination.report
  end

  def show_unique_reports
    @be_reported_users = Report.get_unique_reported.page(params[:page]).per Settings.pagination.report
    status = params["status"]
    order = params["order"]

    if status == "blocked"
      @be_reported_users = @be_reported_users.where("is_blocked = true");
    elsif status == "available"
      @be_reported_users = @be_reported_users.where("is_blocked = false");
    end

    if order == "asc"
      @be_reported_users = @be_reported_users.order("COUNT(reports.reported_id) ASC");
    elsif order == "desc"
      @be_reported_users = @be_reported_users.order("COUNT(reports.reported_id) DESC");
    end
  end
end
