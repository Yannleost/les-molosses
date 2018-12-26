class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
  	true
  end

  def create?
  	true
  end
   	def show? # tous les users peuvent voir les dogs
   	  true
   	end
end
