class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :conversations
  end
end
