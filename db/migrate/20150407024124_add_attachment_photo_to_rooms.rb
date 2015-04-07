class AddAttachmentPhotoToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :rooms, :photo
  end
end
