class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true

      t.timestamps

      # 同じツイートを何度もいいね出来ないようにするため
      t.index %i[user_id tweet_id], unique: true
    end
  end
end
