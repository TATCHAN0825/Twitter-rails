class Tweet < ApplicationRecord
  belongs_to :user

  validate :check_tweet_length

  private

  def check_tweet_length
    count = 0
    text.each_char do |char|
      count += 1 + (char.bytesize > 1 ? 1 : 0)
    end
    if count > 280
      errors.add(:text, :length_too_long)
    end
  end
end
