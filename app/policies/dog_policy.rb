class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

 	def create? # tous les users peuvent créer un dog
 	  true
 	end

 	def show? # tous les users peuvent voir les dogs
 	  true
 	end

  def index2?
    true
  end

 	def update?
 	  record.user == user
  end

  def index_dogs?
    true
  end

  def destroy?
    record.user == user
  end

  def to_user?
    record.user == user
  end

  def upvote?
    true
  end

  def downvote?
    true
  end
end
