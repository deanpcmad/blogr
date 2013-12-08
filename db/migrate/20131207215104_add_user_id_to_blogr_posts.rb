class AddUserIdToBlogrPosts < ActiveRecord::Migration
  def change
    add_reference :blogr_posts, :user, index: true
  end
end
