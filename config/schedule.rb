set :environment, "development"

set :output, {error: "log/cron_error_log.log", standard: "log/cron_log.log"}

job_type :rbenv_rake, %Q{export PATH=/opt/rbenv/shims:/opt/rbenv/bin:/usr/bin:$PATH; eval "$(rbenv init -)"; \
  cd :path && bundle exec rake :task --silent :output }

every "* * 28-31 * *" do
  rbenv_rake "exams:send_statistic_exam"
end
