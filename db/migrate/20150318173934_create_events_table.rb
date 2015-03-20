class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :meetup
      t.belongs_to :user
      t.datetime :event_time
      t.timestamps null:false
    end
  end
end
