# This migration comes from blogr (originally 20131016225633)
class CreateBlogrPosts < ActiveRecord::Migration
  def change
    create_table :blogr_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
