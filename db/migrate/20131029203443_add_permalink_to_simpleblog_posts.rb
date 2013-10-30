class AddPermalinkToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :permalink, :string
  end
end
