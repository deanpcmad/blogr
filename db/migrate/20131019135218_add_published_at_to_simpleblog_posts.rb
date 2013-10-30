class AddPublishedAtToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :published_at, :datetime
  end
end
