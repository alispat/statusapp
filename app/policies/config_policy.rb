class ConfigPolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def edit?
    update?
  end

end