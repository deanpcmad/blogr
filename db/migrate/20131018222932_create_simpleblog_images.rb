class CreateSimpleblogImages < ActiveRecord::Migration
  def change
    create_table :simpleblog_images do |t|
      t.integer :post_id

      t.timestamps
    end
    add_index :simpleblog_images, :post_id
  end
end
