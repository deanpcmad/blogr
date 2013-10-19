# This migration comes from simpleblog (originally 20131019135218)
class AddPublishedAtToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :published_at, :datetime
  end
end
