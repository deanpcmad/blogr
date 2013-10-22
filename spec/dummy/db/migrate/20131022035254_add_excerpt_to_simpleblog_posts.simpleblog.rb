# This migration comes from simpleblog (originally 20131022035201)
class AddExcerptToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :excerpt, :text
  end
end
