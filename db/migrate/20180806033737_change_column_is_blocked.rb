class ChangeColumnIsBlocked < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :isBlocked, :is_blocked
  end
end
