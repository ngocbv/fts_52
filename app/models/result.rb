class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  belongs_to :answer
end
