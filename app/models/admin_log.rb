class AdminLog < ActiveRecord::Base
  enum action: [:login, :logout]

  belongs_to :user_id

  class << self
    def log user, action
      AdminLog.create! user: user, action: action
    end
  end
end
