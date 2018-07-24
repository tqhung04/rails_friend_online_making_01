class CreateConections < ActiveRecord::Migration[5.2]
  def change
    create_table :conections do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :conectiontable_id
      t.string :conectiontable_type
      t.text :first_saying
      t.boolean :status, default: false
      t.boolean :view

      t.timestamps
    end
  end
end
