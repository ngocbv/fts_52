Config.setup do |config|
  config.const_name = "Settings"
end
if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == ENV["dj_username"] && password == ENV["dj_password"]
  end
end
