class AddAttachmentFileToImages < ActiveRecord::Migration
  def self.up
    change_table :blogr_images do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :blogr_images, :file
  end
end
