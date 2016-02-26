class Question < ActiveRecord::Base
  acts_as_paranoid

  enum question_type: [:single, :multiple, :text]
  enum state: [:waiting, :accept, :refuse]

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}
  has_many :results, dependent: :destroy

  belongs_to :subject

  validates :content, presence: true
  validates :answers, presence: true
end
