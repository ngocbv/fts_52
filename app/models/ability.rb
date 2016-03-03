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
      can :create, Exam
      can :read, :all
      can :manage, Question, user_id: user.id
    end
  end
end
