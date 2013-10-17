# This migration comes from simpleblog (originally 20131017015103)
class AddStatusToSimpleblogPosts < ActiveRecord::Migration
  def change
    add_column :simpleblog_posts, :status, :string
  end
end
