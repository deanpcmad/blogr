# This migration comes from simpleblog (originally 20131017002152)
class CreateSimpleblogCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :simpleblog_categories_posts do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
    add_index :simpleblog_categories_posts, :post_id
    add_index :simpleblog_categories_posts, :category_id
  end
end
