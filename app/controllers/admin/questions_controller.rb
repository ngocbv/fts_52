class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new]

  def index
    @search = @questions.accept.search params[:q]
    @questions = @search.result
    @activities = Questions::QuestionActivityService.list_activities
  end

  def new
  end

  def create
    if @question.save
      flash[:success] = t "user.question.create_success"
      redirect_to admin_questions_path
    else
      load_subjects
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit :question_type, :content, :subject_id,
      :user_id, :state, answers_attributes: [:id,
      :correct, :content, :_destroy]
  end

  def load_subjects
    @question.answers.build
    @subjects = Subject.all
  end
end
