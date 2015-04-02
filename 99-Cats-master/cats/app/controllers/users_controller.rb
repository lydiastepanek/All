class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end




end
