namespace :exams do
  desc "Send statistic exam to user every end of the month"
  task send_statistic_exam: :environment do
    Exam.send_statistic_exam
  end
end
