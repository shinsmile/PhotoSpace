class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:id])
    @comment = @prototype.comments.create(comment: params[:comment], prototype_id: params[:prototype_id], user_id: current_user.id)
    @comments = Comments.where(prototype_id: params[:prototype_id])
  end

end
