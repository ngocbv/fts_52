class Admin::SuggestedQuestionsController < ApplicationController
  authorize_resource class: false

  def index
    @search = Question.waiting.search params[:q]
    @suggested_questions = @search.result
  end
end
