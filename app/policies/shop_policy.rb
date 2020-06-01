class ShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    # return true
    return record.user == user
  end

  def show?
    if record.active || record.user == user
      return true
    end
  end

end
