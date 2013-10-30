# This migration comes from blogr (originally 20131017002152)
class CreateBlogrCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :blogr_categories_posts do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
    add_index :blogr_categories_posts, :post_id
    add_index :blogr_categories_posts, :category_id
  end
end
