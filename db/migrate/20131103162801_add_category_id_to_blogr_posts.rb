class AddCategoryIdToBlogrPosts < ActiveRecord::Migration
  def change
    add_reference :blogr_posts, :category, index: true
  end
end
