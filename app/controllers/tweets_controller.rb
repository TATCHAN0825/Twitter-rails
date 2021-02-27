class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]

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

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
