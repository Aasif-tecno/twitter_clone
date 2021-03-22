class CommentsController < ApplicationController
  
  def create
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to tweeet_path(@tweeet)
    else 
        flash[:alert] = @comment.errors.full_messages
    end
  end
  def destroy
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to tweeet_path(@tweeet)
  end
end