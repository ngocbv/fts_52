class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = @questions.accept.search params[:q]
    @questions = @search.result
  end
end
