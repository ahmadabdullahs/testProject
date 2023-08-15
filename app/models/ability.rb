class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.manager?
      can :manage, Project, manager_id: user.id
      can :read, Bug, project: { manager_id: user.id }
    end

    if user.qa?
      can :manage, Bug, user_id: user.id
      can :update, Bug
      can :read,  Project, id: user.user_projects.pluck(:project_id)
    elsif user.developer?
      can :edit, Bug, developer_id: user.id
      can :update, Bug, developer_id: user.id
      can :read, Bug
      can :read, Project, id: user.user_projects.pluck(:project_id)
    end
  end
end
