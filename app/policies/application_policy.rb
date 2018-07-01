class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin? || user.staff?
  end

  def show?
    #scope.where(:id => record.id).exists?
    user.admin? || user.staff?
  end

  def create?
    user.admin? || user.staff?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.staff?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.staff?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
