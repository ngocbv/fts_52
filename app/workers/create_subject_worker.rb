class CreateSubjectWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform subject_id
    subject = Subject.find subject_id
    User.all.each do |user|
      SubjectMailer.create_subject(subject, user).deliver_now
    end
  end
end
