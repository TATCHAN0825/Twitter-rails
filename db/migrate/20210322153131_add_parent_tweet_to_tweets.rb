class AddParentTweetToTweets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweets, :parent_tweet, foreign_key: {to_table: :tweets}
  end
end
