# This migration comes from blogr (originally 20131017015103)
class AddStatusToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :status, :string
  end
end
