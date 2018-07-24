class DogsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]
  def index
   @dogs = Dog.all
  end

  def index2
    if params[:query].present?
        @dogs = Dog.where("breed ILIKE ?", "%#{params[:query]}%")
      else
        @dogs = Dog.all
    end
  end
  def show
    @dog = Dog.find(params[:id])
  end

  def new
   @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    #authorize @dog

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    #authorize @dog

    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :new
    end

  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private
    def dog_params
      params.require(:dog).permit(:picture, :video, :nickname, :breed, :size, :hair, :color, :lof_number, :description, :birthday_date, :prize, :medical_analyse, :father_lof, :mother_lof, :price)
    end
end


