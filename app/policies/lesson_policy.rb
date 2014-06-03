class LessonPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
    user.admin?
  end

  alias_method :new?, :create?
  alias_method :update?, :create?
  alias_method :edit?, :update?
  alias_method :destroy?, :create?
end
