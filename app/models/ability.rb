class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.role? :Admin
      can :manage, :all  
    else
      can :manage, :all
    end
  end
end