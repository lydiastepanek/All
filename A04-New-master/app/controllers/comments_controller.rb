class CommentsController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    #comment.errors.full_messages
    redirect_to link_url(@link.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #comment.errors.full_messages
    redirect_to link_url(@comment.link_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :link_id)
  end

end
