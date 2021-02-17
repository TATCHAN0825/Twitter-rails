class AddImageAndProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string
    add_column :users, :profile, :text
  end
end
