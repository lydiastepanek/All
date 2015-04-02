class LinksController < ApplicationController
  before_action :allowed_access, only: [:new, :create, :index]

  def allowed_access
    redirect_to new_session_url unless logged_in?
  end

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link.id)
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def index
    render :index
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      redirect_to link_url(@link.id)
    else
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
