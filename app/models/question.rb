class Question < ActiveRecord::Base
  acts_as_paranoid

  include PublicActivity::Common

  enum question_type: [:single, :multiple, :text]
  enum state: [:waiting, :accept, :refuse]

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}
  has_many :results, dependent: :destroy

  belongs_to :subject
  belongs_to :user

  validates :content, presence: true
end
