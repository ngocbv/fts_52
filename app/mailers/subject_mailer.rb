class SubjectMailer < ApplicationMailer
  def create_subject subject, user
    @subject = subject
    @user = user
    mail to: user.email, subject: t("subject_mailer.subject")
  end
end
