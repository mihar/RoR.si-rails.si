class AddUserRememberToken < ActiveRecord::Migration
  def self.up
    add_column :users, :remember_token, :string
    add_index :users, [:id, :remember_token]
    add_index :users, :remember_token
  end

  def self.down
    remove_column :users, :remember_token
  end
end
