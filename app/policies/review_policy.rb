class ReviewPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end

    def new?
      return true
    end

    def create?
      return true
    end

  end
end
