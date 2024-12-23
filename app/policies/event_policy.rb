class EventPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def index?
    true
  end

  def show?
    record.user == user || record.event_registered_users.exists?(user: user, status: ['En attente', 'Accepté'])
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def create_invitation?
    record.user == user
  end

  def duplicate?
    record.user == user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
