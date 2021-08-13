class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
    flash[:success] = "Comment added"
  end

  def update
      @post = @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.update(comment_params)

  end

  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if @comment.user == current_user || current_user.admin || current_user == @post.user
        @comment.destroy
        redirect_to post_path(@post)
        flash[:alert] = "Comment deleted"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end


  def set_user

  end
end
