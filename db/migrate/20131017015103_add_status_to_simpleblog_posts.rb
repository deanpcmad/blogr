class AddStatusToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :status, :string
  end
end
