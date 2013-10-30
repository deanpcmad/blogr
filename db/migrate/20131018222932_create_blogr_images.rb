class CreateBlogrImages < ActiveRecord::Migration
  def change
    create_table :blogr_images do |t|
      t.integer :post_id
      t.string :image

      t.timestamps
    end
    add_index :blogr_images, :post_id
  end
end
