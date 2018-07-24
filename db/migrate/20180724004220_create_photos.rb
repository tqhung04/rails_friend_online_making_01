class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :user_id
      t.text :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
