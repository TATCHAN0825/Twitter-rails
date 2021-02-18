class TimelineController < ApplicationController
  before_action :authenticate_user!, only: %i[home]

  def home
    following_ids = current_user.followings.map { |following| following.id }
    following_ids.push(current_user.id) # 自分のツイートも表示する
    @tweets = Tweet.where(user_id: following_ids).order(created_at: 'DESC')
  end

  private

  def set_user
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
