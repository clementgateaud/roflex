class ReviewPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end

    def create?
      return true
    end

    def new?
      return true
    end
  end
end
