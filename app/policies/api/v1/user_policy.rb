class Api::V1::UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.admin?
  end

  def create?
    new?
  end

  def edit?
    user.admin?
  end

  def update?
    edit?
  end

  def destroy?
    user.admin?
  end

end
