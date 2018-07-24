class CreateDesires < ActiveRecord::Migration[5.2]
  def change
    create_table :desires do |t|
      t.integer :user_id
      t.integer :genre
      t.text :description
      t.integer :age_min
      t.integer :age_max
      t.integer :height_min
      t.integer :height_max
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
