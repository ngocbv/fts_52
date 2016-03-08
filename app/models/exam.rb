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
