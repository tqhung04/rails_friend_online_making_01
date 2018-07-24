class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.integer :education
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
