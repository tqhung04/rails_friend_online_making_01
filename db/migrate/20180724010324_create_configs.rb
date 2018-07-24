class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.integer :user_id
      t.string :job
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
