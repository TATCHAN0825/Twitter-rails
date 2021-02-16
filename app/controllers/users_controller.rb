class UsersController < ApplicationController
  include ApplicationHelper

  before_action :set_user

  def show
  end

  def following
    if @user.followings.size < 1
      redirect_to user_path(@user), alert: t('.no-following')
    end
  end

  def followers
    if @user.followers.size < 1
      redirect_to user_path(@user), alert: t('.no-follower')
    end
  end

  private

  def set_user
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
