class TimelineController < ApplicationController
  before_action :authenticate_user!, only: %i[home]

  def home
    following_ids = current_user.followings.map { |following| following.id }
    following_ids.push(current_user.id) # 自分のツイートも表示する
    @tweets = Tweet.where(user_id: following_ids).where('(parent_tweet_id IS NULL) OR (retweet_tweet_id IS NOT NULL)').order(created_at: 'DESC')
    @recommended_users = User.where.not(id: following_ids)
  end

  private

  def set_user
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
