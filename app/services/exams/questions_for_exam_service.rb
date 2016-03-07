module Exams
  class QuestionsForExamService
    def initialize exam
      @exam = exam
    end

    def create_questions
      @questions = Question.where subject: @exam.subject

      @results = @questions.accept.limit(@exam.subject.question_num).order "RANDOM()"
      @results_params = []
      @results.each do |result|
        @results_params << {exam: @exam, question: result}
      end
      Result.create @results_params
    end
  end
end
