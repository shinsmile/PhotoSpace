class CommentsController < ApplicationController

  def create
    @comment = Comment.create(content: comment_params[:content], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    @comments = Comment.where(prototype_id: params[:prototype_id])
    if @comment.save
      render :comment
    end
    # redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :prototype_id
    )
  end

end
