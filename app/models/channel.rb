class Channel < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts, :dependent => :destroy
  has_many :subscriptions, :depencent => :destroy
  validates :name, :presence => true
end
