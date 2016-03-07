class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = @exams.search params[:q]
    @exams = @search.result
    @search.build_condition
    @activities = Exams::ExamsActivityService.list_activities
  end
end
