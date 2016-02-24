class User < ActiveRecord::Base
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :admin_logs, dependent: :destroy
  has_many :exams, dependent: :destroy

  enum role: [:admin, :user]
end
