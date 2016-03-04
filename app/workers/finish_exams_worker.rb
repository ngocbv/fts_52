class FinishExamsWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.finish_exam(exam).deliver_now
  end
end
