class AddMatchingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :matching, :boolean, default: false
  end
end
