class LikesController < ApplicationController

  def index
    @like.dog = @dog
    @dogs = Dogs.where(on: 1)
  end

end
