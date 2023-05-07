class ChangePostsImageColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :image_data, :text,  null: false
  end
end

