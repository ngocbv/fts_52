class Subject < ActiveRecord::Base
  has_many :exams
  has_many :questions
end
