class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
                          params[:user][:email],
                          params[:user][:password]
                          )
    if @user.nil?
      render :new
    else
      login!(@user)
      redirect_to user_url(@user.id)
    end
  end

  def destroy
    logout!(current_user)
  end



end
