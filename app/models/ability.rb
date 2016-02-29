class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif controller_namespace == "Admin"
      cannot :read, :all
    else
      can :create, Exam
      can :read, :all
      can :create, Question
    end
  end
end
