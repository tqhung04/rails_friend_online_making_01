class ChangColunmBodies < ActiveRecord::Migration[5.2]
  def change
    rename_column :table, :old_column, :new_column
  end
end
