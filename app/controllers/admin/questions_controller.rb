class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = @questions.accept.search params[:q]
    @questions = @search.result
    @activities = Questions::QuestionActivityService.list_activities
  end
end
