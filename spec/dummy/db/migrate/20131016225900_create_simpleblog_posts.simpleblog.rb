# This migration comes from simpleblog (originally 20131016225633)
class CreateSimpleblogPosts < ActiveRecord::Migration
  def change
    create_table :simpleblog_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
