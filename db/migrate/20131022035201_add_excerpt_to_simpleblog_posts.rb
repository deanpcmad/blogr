class AddExcerptToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :excerpt, :text
  end
end
