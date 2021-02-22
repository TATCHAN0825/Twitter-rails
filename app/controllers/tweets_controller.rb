class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_tweet, only: %i[show destroy]
  before_action :check_permission, only: %i[destroy]

  def index
    @tweets = Tweet.order(created_at: 'DESC')
  end

  def show
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
    @tweet.destroy
    redirect_to :home, notice: t('.destroyed')
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def check_permission
    unless current_user == @tweet.user
      redirect_to :home, alert: t('.no_permission')
    end
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
