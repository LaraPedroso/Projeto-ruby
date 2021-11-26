# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin) #admin -> (USER), valid -> (Admin)
    if admin.valid?
      can :manage, :all
    else
      can :manage, Admin
    end
  end
end
