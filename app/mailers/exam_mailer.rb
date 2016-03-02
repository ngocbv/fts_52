class ExamMailer < ApplicationMailer
  def finish_exam exam
    @exam = exam
    mail to: @exam.user.email, subject: t(".subject")
  end
end
