class PagesController < ApplicationController
  def index
    @tweeets = Tweeet.all.order(created_at: :desc)
    @user = User.last(10)
  end

  def about
  end
end
