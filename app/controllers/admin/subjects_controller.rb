class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subject = Subject.new
  end

  def create
    respond_to do |format|
      if @subject.save
        CreateSubjectWorker.perform_async @subject.id
        format.html do
          flash[:success] = t ".success"
          redirect_to admin_subjects_path
        end
      end
      format.js
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t ".success"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t ".success"
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description, :duration, :question_num
  end
end
