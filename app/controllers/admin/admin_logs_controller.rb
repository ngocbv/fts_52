class Admin::AdminLogsController < ApplicationController
  load_and_authorize_resource

  def index
    @admin_logs = @admin_logs.order created_at: :desc
  end
end
