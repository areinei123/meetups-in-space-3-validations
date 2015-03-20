class AddTimeToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :time, :datetime
  end
end
