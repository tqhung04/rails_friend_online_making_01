class CreateBirthdays < ActiveRecord::Migration[5.2]
  def change
    create_table :birthdays do |t|
      t.integer :user_id
      t.date :birthday
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
