class ShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    # return true
    record.user_id == user.id
  end

  def show?
    if record.active || record.user == user
      return true
    end
  end

end
