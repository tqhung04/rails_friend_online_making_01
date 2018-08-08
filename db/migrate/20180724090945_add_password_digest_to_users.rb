class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_digest, :string
    change_column :users, :country, :string
    change_column :users, :avatar, :string
  end
end
