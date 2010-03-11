class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics, :force => true do |t|
      t.string :title
      t.datetime :posted_at
      t.integer :user_id
      t.integer :posts_count      

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
