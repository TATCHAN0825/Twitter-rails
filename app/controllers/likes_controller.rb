class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = current_user.likes.new(tweet: @tweet)
    if like.save
      redirect_back fallback_location: root_path, notice: t('.created')
    else
      redirect_back fallback_location: root_path, alert: t('.failed_create')
    end
  end

  def destroy
    like = current_user.likes.find_by!(tweet: @tweet)
    if like.destroy
      redirect_back fallback_location: root_path, notice: t('.destroyed')
    else
      redirect_back fallback_location: root_path, alert: t('.failed_destroy')
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
