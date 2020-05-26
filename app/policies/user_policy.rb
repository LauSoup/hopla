class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
    # record == user
  end

  def update?
    return true
    # record == user
  end
end
