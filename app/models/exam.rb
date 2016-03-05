class Exam < ActiveRecord::Base
  acts_as_paranoid

  include PublicActivity::Common

  enum status: [:unstart, :started, :inprogress, :uncheck, :checked]

  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy

  before_create :check_number_question

  scope :taken_by, -> user{where user_id: user.id}

  accepts_nested_attributes_for :results

  class << self
    def send_statistic_exam
      User.all.each do |user|
        if user.exams.present?
          ExamMailer.send_statistic_exam(user).deliver_now
        end
      end
    end
  end
  private
  def check_number_question
    subject = Subject.find subject_id
    subject.questions.count >= subject.question_num
  end
end
