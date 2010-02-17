class User < ActiveRecord::Base
  
  acts_as_authentic
  
  has_many :messages
  has_many :conversations
  has_many :contacts
  
end
