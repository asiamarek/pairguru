class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params.merge(user_id: current_user.id))
    redirect_to movie_path(@comment.movie_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    raise "Cannot delete other user's comment" unless @comment.user === current_user
    movie_id = @comment.movie_id
    @comment.destroy
    redirect_to movie_path(movie_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :movie_id)
  end
end
