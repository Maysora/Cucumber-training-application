class Message < ActiveRecord::Base
  attr_accessible :content

  belongs_to :author, :class_name => "User"
  belongs_to :parent, :class_name => "Message"

  has_many :replies, :class_name => "Message", :foreign_key => "parent_id", :dependent => :destroy

  validates :author, :presence => true # this will have no effect in cucumber test but needed in unit test
  validates :content, :length => {:in => 3..150}
end
