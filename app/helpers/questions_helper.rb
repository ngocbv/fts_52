module QuestionsHelper
  def question_state question
    case question.state
    when "waiting"
      "<span class='label label-info'>#{question.state}</span>".html_safe
    when "accept"
      "<span class='label label-success'>#{question.state}</span>".html_safe
    when "refuse"
      "<span class='label label-danger'>#{question.state}</span>".html_safe
    end
  end
end
