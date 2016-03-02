class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @activities = Exams::ExamsActivityService.list_activities
  end
end
