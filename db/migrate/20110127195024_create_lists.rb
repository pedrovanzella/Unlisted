class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
			t.string :name
			t.string :creator
			t.integer :list_id
			t.datetime :last_checked
      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
