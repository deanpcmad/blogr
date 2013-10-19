class AddAttachmentFileToImages < ActiveRecord::Migration
  def self.up
    change_table :simpleblog_images do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :simpleblog_images, :file
  end
end
