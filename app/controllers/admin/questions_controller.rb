class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :edit]
  before_action :build_answers, only: [:new]

  def index
    @search = @questions.accept.search params[:q]
    @questions = @search.result.paginate(page: params[:page]).includes(:subject)
    @activities = Questions::QuestionActivityService.list_activities.includes(:owner, :trackable)
  end

  def show
  end

  def new
  end

  def create
    if @question.save
      flash[:success] = t "user.question.create_success"
      redirect_to admin_questions_path
    else
      load_subjects
      build_answers
      render :new
    end
  end

  def edit
  end

  def update
    if params[:state].present?
      check_question params[:state]
    else
      update_question
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t "user.question.delete_success"
    @question.create_activity :destroy, owner: current_user
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit :question_type, :content, :subject_id,
      :user_id, :state, answers_attributes: [:id,
      :correct, :content, :_destroy]
  end

  def build_answers
    @question.answers.reset
    @question.answers.build
  end

  def load_subjects
    @subjects = Subject.all
  end

  def check_question state
    if @question.update_attributes state: state, accepted_by: current_user.id
      flash[:success] = t "user.question.check_success"
      QuestionMailer.check_question(@question).deliver_now
    else
      flash[:danger] = t "user.question.check_fail"
    end
    redirect_to admin_suggested_questions_path
  end

  def update_question
    if @question.update_attributes question_params
      flash[:success] = t "user.question.update_success"
      @question.create_activity :update, owner: current_user
      redirect_to admin_questions_path
    else
      load_subjects
      render :edit
    end
  end
end
