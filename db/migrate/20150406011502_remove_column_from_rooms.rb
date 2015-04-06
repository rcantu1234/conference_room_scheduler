class RemoveColumnFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :dob, :date
  end
end
