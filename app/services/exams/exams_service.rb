module Exams
  class ExamsService
    def initialize exam
      @exam = exam
    end

    def change_status params
      @exam.update_attributes time_start: Time.now if @exam.time_start.nil?
      @exam.update_attributes status: Settings.exams.status.started if @exam.unstart?
      if params[:save_exam].present?
        @exam.update_attributes status: Settings.exams.status.inprogress
      end
      if params[:finish_exam].present? || (params[:save_exam].nil? &&
        params[:finish_exam].nil? && !@exam.unstart? && !@exam.checked?)
        @exam.update_attributes status: Settings.exams.status.uncheck
      end
    end

    def check_results
      correct_num = 0
      results = {}
      @exam.results.each do |result|
        correct = result.check_correct
        correct_num += 1 if correct
        results[result.id] = {correct: correct}
      end
      Result.update results.keys, results.values
      @exam.update_attributes status: Settings.exams.status.checked, score: correct_num
      FinishExamsWorker.perform_async @exam.id if Rails.env.development?
    end
  end
end
