class PagesController < ApplicationController
  def index
    @tweeets = Tweeet.all.order(created_at: :desc)
    if user_signed_in?
      @user = User.where.not(id: current_user.id).order(created_at: :desc).last(10)
    else
      @user = User.order(created_at: :desc).last(10)
    end
  end

  def dashboard
    @user = User.find(params[:id])
    @tweeets = @user.tweeets.all.order(created_at: :desc)
    @users = User.order(created_at: :desc).last(10)

  end

  def search
    @friends = User.search(params[:search])
    if @friends.empty?
      redirect_to root_path
      flash[:alert] = "Couldn't find user"
    end
  end

end
