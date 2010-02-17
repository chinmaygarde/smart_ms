class AddWithNumberToConversation < ActiveRecord::Migration
  def self.up
    add_column :conversations, :with_number, :string
  end

  def self.down
    remove_column :conversations, :with_number
  end
end
