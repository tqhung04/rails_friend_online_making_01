class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :reported_id
      t.text :description

      t.timestamps
    end
  end
end
