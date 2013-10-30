class CreateBlogrPosts < ActiveRecord::Migration
  def change
    create_table :blogr_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
