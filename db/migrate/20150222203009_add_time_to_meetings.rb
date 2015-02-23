class AddTimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :start_time, :datetime
    add_column :meetings, :end_time, :datetime
  end
end
