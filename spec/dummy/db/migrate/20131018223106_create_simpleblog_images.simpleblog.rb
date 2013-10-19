# This migration comes from simpleblog (originally 20131018222932)
class CreateSimpleblogImages < ActiveRecord::Migration
  def change
    create_table :simpleblog_images do |t|
      t.integer :post_id

      t.timestamps
    end
    add_index :simpleblog_images, :post_id
  end
end
