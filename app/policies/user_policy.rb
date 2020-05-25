class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def show?
    @current_user == @user
  end

  def update?
    record == @user
  end
end
