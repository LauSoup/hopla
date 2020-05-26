class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      return true
      # record.shop.user == user
    end

    def create?
      return true
      # record.shop.user == user
    end

    def update?
      return true
      # record.shop.user == user
    end
  end
end
