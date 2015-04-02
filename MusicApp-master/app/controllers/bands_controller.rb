class BandsController < ApplicationController


  def index
    render :index
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      render json: @band
      #redirect_to band_url(@band.id)
    else
      render :edit
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:band_name)
  end

end
