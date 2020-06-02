class FavoriteEventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def destroy?
      return true
    end
  end
end
