module Exams
  class StartExamJob < Struct.new(:exam_id)
    def perform
      exam = Exam.find exam_id
      if exam.unstart?
        ExamMailer.start_exam(exam).deliver_now
      end
    end
  end
end
