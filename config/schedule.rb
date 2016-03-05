set :environment, "development"

set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
  rake "exams:send_statistic_exam"
end
