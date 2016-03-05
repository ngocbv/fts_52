class ExamMailer < ApplicationMailer
  def finish_exam exam
    @exam = exam
    mail to: @exam.user.email, subject: t(".subject")
  end

  def start_exam exam
    @exam = exam
    mail to: @exam.user.email, subject: t(".subject")
  end

  def send_statistic_exam user
    @user = user
    mail to: @user.email, subject: t(".subject")
  end
end
