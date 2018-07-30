class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :educations, :education, :string
    change_column :configs, :job, :string
    add_column :desires, :weight_max, :integer
    add_column :desires, :weight_min, :integer
    add_column :bodies, :height, :integer
    add_column :bodies, :weight, :integer
  end
end
