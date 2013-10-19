class AddPublishedAtToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :published_at, :datetime
  end
end
