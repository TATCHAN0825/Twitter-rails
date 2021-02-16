class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
