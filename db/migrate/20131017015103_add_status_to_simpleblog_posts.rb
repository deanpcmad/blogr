class AddStatusToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :status, :string
  end
end
