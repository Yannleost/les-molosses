

class ReviewsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
  	@review = Review.new
    authorize @review
  end

  def create  

    @dog = Dog.find(params[:dog_id])
    @review = Review.new(review_params)
       authorize @review
    @review.dog_id = @dog.id
    
    @review.save!
  	if @review.save
     redirect_to dog_path(@dog)
   else
     render :new
   end
  end
  
  def show
    @review = Review.find(params[:id])
    authorize @review
  end 

private
  def review_params
  	 params.require(:review).permit(:content)
  end
end
