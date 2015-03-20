class AddMeetupTable < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :description, null: false
    end
  end
end
