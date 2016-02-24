class Exam < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy
end
