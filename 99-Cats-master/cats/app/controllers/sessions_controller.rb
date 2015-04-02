class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: [:new, :create]

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
                          params[:user][:user_name],
                          params[:user][:password]
                          )
    if user.nil?
      render :new
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

end
