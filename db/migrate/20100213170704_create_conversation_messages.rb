class CreateConversationMessages < ActiveRecord::Migration
  def self.up
    create_table :conversation_messages do |t|
      t.integer :conversation_id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :conversation_messages
  end
end
