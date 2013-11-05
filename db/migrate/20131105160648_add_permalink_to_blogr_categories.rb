class AddPermalinkToBlogrCategories < ActiveRecord::Migration
  def change
    add_column :blogr_categories, :permalink, :string
  end
end
