class Question < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :subject

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
end
