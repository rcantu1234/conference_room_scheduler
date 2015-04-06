class AddColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :dob, :date
  end
end
