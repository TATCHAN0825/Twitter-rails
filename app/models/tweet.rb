class Tweet < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy
  belongs_to :retweet_tweet, class_name: 'Tweet', foreign_key: 'retweet_tweet_id', optional: true
  has_many :retweets, class_name: 'Tweet', :foreign_key => 'retweet_tweet_id'

  validate :check_tweet_length
  validates :text, presence: true

  private

  def check_tweet_length
    count = 0
    text.each_char do |char|
      count += 1 + (char.bytesize > 1 ? 1 : 0)
    end
    if count > 280
      errors.add(:text, :too_long, count: 280)
    end
  end
end
