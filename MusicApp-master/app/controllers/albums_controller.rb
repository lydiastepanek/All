class AlbumsController < ApplicationController

  # before_action :redirect_if_logged_out
  #
  # def redirect_if_logged_out
  #   return if !!current_user
  #   redirect_to new_session_url if current_user.nil?
  # end

  def index
    render :index
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      render json: @album
      #redirect_to album_url(@album.id)
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    render :index
  end

  private

  def album_params
    params.require(:album).permit(:album_name, :album_type)
  end

end
