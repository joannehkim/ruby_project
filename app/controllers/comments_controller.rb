class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
  end

  def create
    @comment = Comment.create(content: comment_params[:content], user_id: current_user.id, commentable_id: comment_params[:commentable_id], commentable_type: comment_params[:commentable_type])
    redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def comment_params
  params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
end
