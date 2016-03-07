class User < ActiveRecord::Base
  acts_as_paranoid

  enum role: [:user, :admin]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :admin_logs, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :questions

  validates :password, presence: true, allow_nil: true

  class << self
    def ransackable_attributes auth_object = nil
      super & ["email", "name", "chatwork_id"]
    end
  end

  def is_user? user
    self == user
  end
end
