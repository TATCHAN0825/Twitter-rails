class AddRetweetToTweet < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweets, :retweet_tweet, foreign_key: {to_table: :tweets}
  end
end
