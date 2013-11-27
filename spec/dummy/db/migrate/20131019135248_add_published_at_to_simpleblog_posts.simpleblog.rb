# This migration comes from blogr (originally 20131019135218)
class AddPublishedAtToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :published_at, :datetime
  end
end
