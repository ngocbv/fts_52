class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = @exams.search params[:q]
    @exams = @search.result.includes(:subject)
    @search.build_condition
    @activities = Exams::ExamsActivityService.list_activities.includes(:owner, :trackable)
  end
end
