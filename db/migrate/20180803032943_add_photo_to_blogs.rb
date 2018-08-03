class AddPhotoToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :photo, :string
  end
end
