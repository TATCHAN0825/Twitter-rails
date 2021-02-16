class AddScreenNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :screen_name, :string, null: false, unique: true
  end
end
