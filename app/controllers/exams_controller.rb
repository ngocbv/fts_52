class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = Exam.taken_by current_user
  end
end
