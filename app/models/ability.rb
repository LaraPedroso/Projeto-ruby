# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin) #admin -> (USER), adminn -> (Admin)
    if admin.adminn?
      can :manage, :all
    end
  end
end
