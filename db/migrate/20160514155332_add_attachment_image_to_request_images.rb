class AddAttachmentImageToRequestImages < ActiveRecord::Migration
  def self.up
    change_table :request_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :request_images, :image
  end
end
