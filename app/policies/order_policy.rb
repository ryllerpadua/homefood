class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    owner?
  end

  def new?
    user
  end

  def create?
    user
  end

  private

  def owner?
    record.user == user
  end

end
