class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |table|
      table.string :user
      table.integer :event_id
    end

  end

  def self.down
    drop_table :attendances
  end
end
