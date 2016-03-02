class Result < ActiveRecord::Base
  serialize :content_answer, Array
  belongs_to :exam
  belongs_to :question
  belongs_to :answer

  def check_correct
    if question.text?
      content_answer[0] == question.answers[0].content
    else
      temp = []
      question.answers.each do |answer|
        temp << answer.id if answer.correct
      end
      temp == content_answer
    end
  end
end
