class DogsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show, :create, :edit, :destroy, :index2, :upvote, :downvote]
  def index
  # @dogs = Dog.order(:nickname).page params[:page]
   @dogs = policy_scope(Dog).page params[:page]

  # @records = policy_scope(Record).paginate(params[:page])
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
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
      @dogs = policy_scope(Dog.where("breed ILIKE ?", "%#{params[:query]}%").page params[:dog])
      # @lands_geo = Land.search_by_title_and_address(params[:query]).where.not(latitude: nil, longitude: nil)
      @dogs_geo = Dog.where.not(latitude: nil, longitude: nil)
    else
      @dogs = policy_scope(dog)
      @dogs_geo = Dog.where.not(latitude: nil, longitude: nil)
    end

     authorize @dogs

     @markers = @dogs_geo.map do |dog|
     {
       lat: dog.latitude,
       lng: dog.longitude,
       nickname: dog.nickname
     }
    end


  end

def upvote
  @dog = Dog.find(params[:id])
  @dog.upvote_by current_user
  authorize @dog
  redirect_to dogs_path
end

def downvote
  @dog = Dog.find(params[:id])
  @dog.downvote_by current_user
    authorize @dog
  redirect_to dogs_path
end

 def age
  @dog = Dog.find(params[:id])
  @age = Date.today.year - @dog.birthday_date.year
  # @age -= 1 if Date.today < @dogs.birthday_date + @age.years
   #for days before birthday
 end

  private
  def dog_params
    params.require(:dog).permit(:picture, :address, :video, :nickname, :breed, :size, :hair, :color, :lof_number, :description, :birthday_date, :medical_analyse, :father_lof, :mother_lof, :price, :eye_color, :version, :weight, :prize)
  end
end


