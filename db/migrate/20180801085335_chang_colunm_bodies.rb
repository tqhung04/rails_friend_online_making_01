class ChangColunmBodies < ActiveRecord::Migration[5.2]
  def change
    change_column :bodies, :body, :string
  end
end
