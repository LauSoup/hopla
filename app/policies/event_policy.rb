class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      record.shop.user == user
    end

    def update?
      record.shop.user == user
    end
  end
end
