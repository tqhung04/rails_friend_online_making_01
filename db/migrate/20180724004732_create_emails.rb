class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :user_id
      t.string :email
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
