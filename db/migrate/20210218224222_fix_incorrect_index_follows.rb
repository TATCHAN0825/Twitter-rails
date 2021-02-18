class FixIncorrectIndexFollows < ActiveRecord::Migration[6.1]
  def change
    # まずindexとカラムの不整合を解消する
    add_column :follows, :'user_id,', :integer
    # 不正なindex削除(事前に不整合を解消しないとインデックスが存在しないと言われる)
    remove_index :follows, %i[user_id, target_id]
    # 不整合解消用に作った一時カラムを削除
    remove_column :follows, :'user_id,', :integer
    # 正しいindexを貼る
    add_index :follows, %i[user_id target_id], unique: true # 重複フォローを防止する
  end
end
