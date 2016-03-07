module SubjectsHelper
  def status_button exam
    if exam.unstart?
      link_to t(:start), exam, class: "btn btn-primary"
    else
      link_to t(:view), exam, class: "btn btn-success"
    end
  end

  def format_score exam
    if exam.score.nil?
      "-"
    else
      "#{exam.score}/#{exam.question_num}".html_safe
    end
  end
end
