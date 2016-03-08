class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    if user.admin?
      can :manage, :all
      can :index, :suggested_questions
    elsif controller_namespace == "Admin"
      cannot :read, :all
    else
      can [:index, :create], Exam
      can [:show, :update], Exam, user_id: user.id
      can :manage, Question, user_id: user.id
    end
  end
end
