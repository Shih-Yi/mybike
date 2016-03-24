class AddBodyToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :body, :text
  end
end
