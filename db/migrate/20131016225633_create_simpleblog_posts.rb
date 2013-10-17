class CreateSimpleblogPosts < ActiveRecord::Migration
  def change
    create_table :simpleblog_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
