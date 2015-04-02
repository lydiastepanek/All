class CatRentalRequestsController < ApplicationController


  before_action  :owns_cat?, only: [:approve, :deny]

  def owns_cat?
    @cat = CatRentalRequest.find(params[:id]).cat
    redirect_to cats_url unless current_user.id == @cat.user_id
  end

  def new
    @catrental = CatRentalRequest.new
    render :new
  end

  def create
    @catrental = CatRentalRequest.new(cat_rental_params)
    @catrental.user_id = current_user.id
    if @catrental.save
      redirect_to cat_url(@catrental.cat_id)
    else
      render :new
    end
  end

  def approve
    @catrental = CatRentalRequest.find(params[:id])
    @catrental.approve!
    redirect_to cat_url(@catrental.cat_id)
  end

  def deny
    @catrental = CatRentalRequest.find(params[:id])
    @catrental.deny!
    redirect_to cat_url(@catrental.cat_id)
  end


  # def edit
  #   @catrental = CatRentalRequest.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  # @catrental = CatRentalRequest.find(params[:id])
  #   if @catrental.update(cat_rental_params)
  #     redirect_to cat_rental_request_url(@catrental.id)
  #   else
  #     render :edit
  #   end
  # end

  private

  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
