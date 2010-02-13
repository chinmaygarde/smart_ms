class CreateConversationsMessages < ActiveRecord::Migration
  def self.up
    create_table :conversations_messages, {:id => false} do |t|
      t.integer :conversation_id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :conversations_messages
  end
end
