class QuestionMailer < ApplicationMailer
  def check_question question
    @question = question
    mail to: question.user.email, subject: t("question_mailer.subject")
  end
end
