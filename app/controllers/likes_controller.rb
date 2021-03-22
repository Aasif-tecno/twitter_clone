class LikesController < ApplicationController
  def create
    @tweeet = Tweeet.find(params[:id])
    @like = @tweeet.likes.create(user_id: current_user.id)
    redirect_to tweeet_path(@tweeet)
   
  end

  def destroy
    @tweeet = Tweeet.find(params[:id])
    @like = Like.find_by(user_id: current_user.id)
    @like.destroy
    redirect_to tweeet_path(@tweeet)
  end

end
