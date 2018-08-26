class DogsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show, :create, :edit, :destroy, :index2]


  def index
   # @dogs = Dog.all
   # @dogs = Dog.order(:nickname).page params[:page]
   @dogs = policy_scope(Dog).page params[:page]

  # @records = policy_scope(Record).paginate(params[:page])
  end


  def show
    @dog = Dog.find(params[:id])
    authorize @dog
    if @dog.latitude
      @marker = [{
        lat: @dog.latitude,
        lng: @dog.longitude,
      }]
    end
  end

  def new
   @dog = Dog.new 
   authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
    authorize @dog
  end

  def update
    @dog = Dog.find(params[:id])
    authorize @dog 
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    authorize @dog
    @dog.destroy
    redirect_to dogs_path
  end
  
  def index2
     if params[:query].present?
        @dogs = Dog.where("breed ILIKE ?", "%#{params[:query]}%").page params[:dog]
      else
        @dogs = Dog.all.page params[:page]
    end

    authorize @dogs
    @dogsmarkers = Dog.where.not(latitude: nil, longitude: nil)
    @markers = @dogsmarkers.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
      }

  end

  end

  private
  def dog_params
    params.require(:dog).permit(:picture, :address, :video, :nickname, :breed, :size, :hair, :color, :lof_number, :description, :birthday_date, :prize, :medical_analyse, :father_lof, :mother_lof, :price)
  end
end


