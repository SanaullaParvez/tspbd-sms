class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest us
    if user.admin?
      can :manage, :all
    elsif user.student?
      can :read, :all
      can :manage, Student, :admission_no => user.username
      cannot :create, Student
    elsif user.employee?
      can :read, :all
      can :manage, Employee, :employee_number => user.username
      #cannot :create, Employee
    else
      can :read, MyConfiguration
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
