class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_user, only: [:index]
  before_action :load_subjects, only: [:new]

  def index
    @questions = @user.questions
  end

  def new
    @question.answers.build
  end

  def create
    if @question.save
      flash[:success] = t "user.question.create_success"
      @question.create_activity :create, owner: current_user
      redirect_to :back
    else
      load_subjects
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
      @question.create_activity :update, owner: current_user
      redirect_to user_questions_path current_user
    else
      @subjects = Subject.all
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t "user.question.delete_success"
    @question.create_activity :destroy, owner: current_user
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

  def load_subjects
    @question.answers.build
    @subjects = Subject.all
  end
end
