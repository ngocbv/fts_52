module SubjectsHelper
  def status_button status
    if status == "unstart"
      link_to t(:start), "#", class: "btn btn-primary"
    else
      link_to t(:view), "#", class: "btn btn-success"
    end
  end

  def format_score exam
    if exam.score.nil?
      "-"
    else
      "#{exam.score}/#{exam.subject.question_num}".html_safe
    end
  end
end
