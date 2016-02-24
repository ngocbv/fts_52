class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @subjects = Subject.all
    @question.answers.build
  end

  def create
    if @question.save
      flash[:sucess] = t "user.question.create_success"
    else
      flash[:danger] = t "user.question.create_fail"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit :question_type, :content, :subject_id,
      :created_by, :state, answers_attributes: [:id,
      :correct, :content, :_destroy]
  end
end
