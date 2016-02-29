class Exam < ActiveRecord::Base
  acts_as_paranoid

  enum status: [:unstart, :started, :inprogress, :uncheck, :checked]

  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy

  scope :taken_by, -> user{where user_id: user.id}
end
