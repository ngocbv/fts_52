class Subject < ActiveRecord::Base
  acts_as_paranoid

  has_many :exams
  has_many :questions, dependent: :destroy

  validates :duration, numericality: true
  validates :question_num, numericality: [only_integer: true]
  validates :name, presence: true
end
