class FollowsController < ApplicationController
    before_action :authenticate_user!

    def follow
        @user = User.find(params[:id])
        Follow.create(follower_id: current_user.id, followee_id: @user.id)
        redirect_to user_path(@user)
    end
    def unfollow
        @user = User.find(params[:id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_to user_path(@user)
    end

    def followers
        @user = User.find(params[:id])

    end


end