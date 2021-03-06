# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Task, owner_id: user.id #xq task_controller contiene @owner = current user
  end
end
