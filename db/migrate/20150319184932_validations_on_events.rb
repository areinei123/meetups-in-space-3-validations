class ValidationsOnEvents < ActiveRecord::Migration
  def change
    def up
      change_column :events, :meetup_id, :integer, null: false
      change_column :events, :user_id, :integer, null:false
    end
    def down
      change_column :events, :meetup_id, :integer
      change_column :events, :user_id, :integer
    end
  end
end
