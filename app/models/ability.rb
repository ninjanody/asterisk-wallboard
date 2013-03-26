class Ability
  include CanCan::Ability

  def initialize(user)
    
    # Abilities for ADMIN role
    if user && user.role == "admin"
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      cannot :manage, :agent
      cannot :manage, :manager
      
    # Abilities for AGENT role
    elsif user && user.role == "agent"
      can :manage, :agent
      
    # Abilities for MANAGER role
    elsif user && user.role == "manager"
      can :manage, :manager
    end
  end
end
