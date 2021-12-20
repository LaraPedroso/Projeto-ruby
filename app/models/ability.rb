# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin) #admin -> (USER), adminn -> (Admin)
    if admin.adminn?
      can :manage, :all
    elsif admin.comentarista?
      can :create, Comment
    else 
      can :read, :all
    end
  end
end
