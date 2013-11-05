class CreateBlogrTags < ActiveRecord::Migration
  def change
    create_table :blogr_tags do |t|
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end
end
