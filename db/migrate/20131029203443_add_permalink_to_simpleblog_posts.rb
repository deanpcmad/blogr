class AddPermalinkToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :permalink, :string
  end
end
