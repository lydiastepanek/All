class CatsController < ApplicationController

  before_action  :owns_cat?, only: [:edit, :update]

  def owns_cat?
    @cat = Cat.find(params[:id])
    redirect_to cats_url unless current_user.id == @cat.user_id
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @current_user = current_user
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render :new
    end
  end


  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
  @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat.id)
    else
      render :edit
    end
  end


  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
