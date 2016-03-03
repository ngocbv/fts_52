module Exams
  class ExamsActivityService
    class << self
      def list_activities
        PublicActivity::Activity.where trackable_type: "Exam"
      end
    end
  end
end
