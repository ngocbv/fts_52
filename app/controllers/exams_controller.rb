class ExamsController < ApplicationController
  load_and_authorize_resource
  before_action :change_status, only: [:show, :update]

  def index
    @exams = @exams.taken_by(current_user).order created_at: :desc
    @subjects = Subject.all
    @exam = Exam.new
  end

  def create
    if @exam.save
      flash[:success] = t ".success"
      Exams::QuestionsForExamService.new(@exam).create_questions
      @exam.create_activity :create, owner: current_user
    else
      flash[:warning] = t ".fail"
    end
    redirect_to exams_path
  end

  def show
    @time_remaining = @exam.subject.duration - @exam.spent_time
  end

  def update
    if @exam.update_attributes exam_params
      flash[:success] = t ".success"
      Exams::ExamsService.new(@exam).check_results if @exam.uncheck?
      @exam.create_activity :update, owner: current_user
    else
      flash[:warning] = t ".fail"
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :user_id, :spent_time, :subject_id, results_attributes:
      [:id, :question_id, content_answer: []]
  end

  def change_status
    Exams::ExamsService.new(@exam).change_status params
  end
end
