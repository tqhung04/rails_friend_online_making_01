class Admin::ComplaintsController < Admin::AdminController

  def index
    @complaints = Complaint.all.ordered_by_created_at.page(params[:page]).per Settings.pagination.report
  end
end
