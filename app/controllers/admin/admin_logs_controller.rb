class Admin::AdminLogsController < ApplicationController
  load_and_authorize_resource

  def index
    @admin_logs = @admin_logs.ordered.paginate(page: params[:page], per_page:
      Settings.per_page_activity).includes(:user)
  end
end
