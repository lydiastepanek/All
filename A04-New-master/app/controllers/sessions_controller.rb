class SessionsController  < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    logout!(@user)
    redirect_to new_session_url
  end



end
