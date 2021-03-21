class RenameNoyficationsColumToNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_table :notfications, :notifications
  end
end
