class User < ActiveRecord::Base
  acts_as_paranoid

  enum role: [:user, :admin]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :admin_logs, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :questions

  validates :password, presence: true, allow_nil: true

  def is_user? user
    self == user
  end
end
