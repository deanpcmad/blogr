class AddPostImageToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :post_image, :string
  end
end
