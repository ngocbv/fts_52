module Questions
  class QuestionActivityService
    class << self
      def list_activities
        PublicActivity::Activity.where(trackable_type: "Questions")
          .order(created_at: :desc).limit Settings.view_limit_activities
      end
    end
  end
end
