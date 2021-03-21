class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy retweet]

  def index
    @tweets = Tweet.order(created_at: 'DESC')
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweet_path(@tweet), notice: t('.created')
    else
      render :new
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to :home, notice: t('.destroyed')
  end

  def retweet
    target_tweet = Tweet.find(params[:id])
    if target_tweet.user === current_user or (tweet.retweets.map { |retweet| retweet.user }).include?(current_user)
      redirect_back fallback_location: root_path, alert: t('.failed_retweet')
      return
    end
    tweet = target_tweet.retweets.create(text: target_tweet.text, user: current_user)
    redirect_to tweet_path(tweet), notice: t('.retweeted')
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
