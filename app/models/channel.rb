class Channel < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts
  validates :name, :presence => true
end
