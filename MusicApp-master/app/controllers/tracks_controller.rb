class TracksController < ApplicationController


  def index
    render :index
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      render json: @track
      #redirect_to track_url(@track.id)
    else
      render :edit
    end
  end

  private

  def track_params
    params.require(:track).permit(:track_name, :track_type, :lyrics)
  end


end
