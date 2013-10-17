class CreateSimpleblogCategories < ActiveRecord::Migration
  def change
    create_table :simpleblog_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
