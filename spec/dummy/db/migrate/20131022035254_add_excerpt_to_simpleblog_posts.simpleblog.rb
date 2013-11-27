# This migration comes from blogr (originally 20131022035201)
class AddExcerptToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :excerpt, :text
  end
end
