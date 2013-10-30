class CreateBlogrPosts < ActiveRecord::Migration
  def change
    create_table :blogr_posts do |t|
      t.string :title
      t.text :content
      t.string :permalink
      t.boolean :published, default: false
      t.datetime :published_at

      t.timestamps
    end
  end
end