class PostsController < ApplicationController

  def new
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def index
    @posts = Post.all
    render :index
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render :show
    else
      # render @post.errors.full_messages
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show
    else
      @errors = @post.errors.full_messages
      print @errors
      render json: @errors, status: 422
    end
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :id)
  end
end
