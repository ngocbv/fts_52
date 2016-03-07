class Exam < ActiveRecord::Base
  acts_as_paranoid

  include PublicActivity::Common

  enum status: [:unstart, :started, :inprogress, :uncheck, :checked]

  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy

  before_create :check_number_question
  before_create :assign_duration_question_num

  scope :taken_by, -> user{where user_id: user.id}

  accepts_nested_attributes_for :results

  def real_time_spent
    spent_time ? spent_time + (Time.now - updated_at).to_i : duration
  end

  class << self
    def send_statistic_exam
      User.all.each do |user|
        ExamMailer.send_statistic_exam(user).deliver_now if user.exams.present?
      end
    end
  end
  private
  def check_number_question
    subject = Subject.find subject_id
    subject.questions.count >= subject.question_num
  end

  def assign_duration_question_num
    self.duration = subject.duration if duration.nil?
    self.question_num = subject.question_num if question_num.nil?
  end
end
