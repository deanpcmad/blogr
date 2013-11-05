class CreateBlogrTaggings < ActiveRecord::Migration
  def change
    create_table :blogr_taggings do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
