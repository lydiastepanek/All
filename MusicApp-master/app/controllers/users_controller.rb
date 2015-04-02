class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    # (email: params[:user][:email],
    #                 password: params[:user][:password]
    #                 )

    if @user.save
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  def index
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end



end
