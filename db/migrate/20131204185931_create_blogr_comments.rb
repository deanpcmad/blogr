class CreateBlogrComments < ActiveRecord::Migration
  def change
    create_table :blogr_comments do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.text :content
      t.string :author_name
      t.string :author_email

      t.timestamps
    end
  end
end
