class LikesController < ApplicationController

  def new
  	@like = Like.new
  	authorize @like
  end

  def create
  	@like = Like.new(like_params)
  	@authorize @like
  	@like.save
  end

  private
  def like_params
  	params.require(:like).permit()
  end
end
