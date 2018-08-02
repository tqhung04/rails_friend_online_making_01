class ReportController < ApplicationController
  def create
    @report = Report.new report_params
    if @report.save
      respond_to do |format|
        format.js {}
      end
    else
      flash.now[:error] = t "report.create_failed_msg"
    end
  end

  private
  def report_params
    params.require(:report).permit Report::ATTRIBUTES_PARAMS
  end
end
