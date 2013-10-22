class AddExcerptToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :excerpt, :text
  end
end
