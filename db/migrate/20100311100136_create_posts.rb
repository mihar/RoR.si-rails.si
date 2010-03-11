class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.text :body
      t.text :cached_body_html
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
