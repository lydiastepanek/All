class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    success = user.update!(user_params)
    if success
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
      user = User.delete(params[:id])
      render json: user
  end

  private

  def user_params
    ## params.require(:user).permit(:user, :email)
    params.require(:user).permit(:username)
  end


end
