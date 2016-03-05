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

  private
  def answers_count_valid?
    answers.count >= Settings.answers_count_min
  end

  def check_answers_count
    unless answers_count_valid?
      errors.add :answers, I18n.t("errors.answers_count_not_valid")
    end
  end
end
