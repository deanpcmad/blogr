# This migration comes from blogr (originally 20131017001901)
class CreateBlogrCategories < ActiveRecord::Migration
  def change
    create_table :blogr_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
