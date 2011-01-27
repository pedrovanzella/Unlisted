class AddUsernameColumnToUser < ActiveRecord::Migration
  def self.up
		add_column :users, :username, :string
		add_column :users, :email, :string
  end

  def self.down
		remove_column :users, :username
		remove_column :users, :email
  end
end
