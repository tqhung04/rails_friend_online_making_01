class AddIsBlockedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isBlocked, :boolean, default: false
  end
end
