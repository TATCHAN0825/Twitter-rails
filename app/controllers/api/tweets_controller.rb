module Api
  class TweetsController < ApiController
    def index
      render json: Tweet.all
    end
  end
end
