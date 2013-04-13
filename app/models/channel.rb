class Channel < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts, :dependent => :destroy
  validates :name, :presence => true
end
