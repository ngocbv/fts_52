class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = @exams.taken_by(current_user).order created_at: :desc
    @subjects = Subject.all
    @exam = Exam.new
  end

  def create
    if @exam.save
      flash[:success] = t ".success"
      Exams::CreateQuestionsForExam.new(@exam).create_questions
    else
      flash[:warning] = t ".fail"
    end
    redirect_to user_exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :user_id, :subject_id
  end
end
