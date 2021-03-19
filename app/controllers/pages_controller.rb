class PagesController < ApplicationController
  def index
    @tweeets = Tweeet.all.order(created_at: :desc)
    @user = User.last(10)
  end

  def dashboard
    @user = User.find(params[:id])
    @tweeets = @user.tweeets.all.order(created_at: :desc)
    @users = User.last(10)

  end
end
