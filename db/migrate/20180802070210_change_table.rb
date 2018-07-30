class ChangeTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :configs, :careers
  end
end
