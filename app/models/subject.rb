class Subject < ActiveRecord::Base
  acts_as_paranoid

  has_many :exams
  has_many :questions, dependent: :destroy
end
