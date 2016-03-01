class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_user, only: [:index]

  def index
    @questions = @user.questions
  end

  def new
    @subjects = Subject.all
    @question.answers.build
  end

  def create
    if @question.save
      flash[:success] = t "user.question.create_success"
      redirect_to :back
    else
      flash[:danger] = t "user.question.create_fail"
      render :new
    end
  end

  def edit
    @subjects = Subject.all
  end

  def show
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "user.question.update_success"
      redirect_to user_questions_path current_user
    else
      flash[:danger] = t "user.question.update_fail"
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t "user.question.delete_success"
    redirect_to user_questions_path current_user
  end

  private
  def question_params
    params.require(:question).permit :question_type, :content, :subject_id,
      :user_id, :state, answers_attributes: [:id,
      :correct, :content, :_destroy]
  end

  def load_user
    @user = User.find params[:user_id]
  end
end
