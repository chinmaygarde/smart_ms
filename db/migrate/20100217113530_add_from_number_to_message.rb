class AddFromNumberToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :from_number, :string
  end

  def self.down
    remove_column :messages, :from_number
  end
end
