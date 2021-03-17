class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: {to_table: :users}

      t.timestamps

      t.index %i[user_id target_id], unique: true # 重複フォローを防止する
    end
  end
end