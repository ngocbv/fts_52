class AdminLog < ActiveRecord::Base
  enum action: [:login, :logout]

  belongs_to :user

  scope :ordered, ->{order created_at: :desc}

  class << self
    def log user, action
      user.admin_logs.create! action: action
    end
  end
end
