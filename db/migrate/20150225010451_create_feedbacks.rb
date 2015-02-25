class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :message
      t.belongs_to :user, index: true
      t.belongs_to :meeting, index: true

      t.timestamps null: false
    end
    add_foreign_key :feedbacks, :users
    add_foreign_key :feedbacks, :meetings
  end
end
