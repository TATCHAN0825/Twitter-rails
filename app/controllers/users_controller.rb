class UsersController < ApplicationController

  include ApplicationHelper

  before_action :set_user, except: %i[index]

  def show
    @tweets = @user.tweets.order(created_at: 'DESC')
  end

  def following
    if @user.followings.size < 1
      redirect_back fallback_location: root_path, alert: t('.no_following')
    end
  end

  def followers
    if @user.followers.size < 1
      redirect_back fallback_location: root_path, alert: t('.no_follower')
    end
  end

  def index
    @users = User.order(created_at: 'ASC')
  end

  private

  def set_user
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
