class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    # return true
    record.shop.user == user
  end

  def create?
    # return true
    record.shop.user == user
  end

  def update?
    # return true
    record.shop.user == user
  end

  def updatebuyers?
    record.shop.user == user
  end

end
