class Channel < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy
  validates :name, :presence => true

  def subscribe(username)
    unless subscribed? username
      return subscriptions.build :username => username
    else
      return false
    end
  end

  def subscribed?(username)
    !!find_subscription(username)
  end

  def find_subscription(username)
  	return Subscription.find_by_username username
  end
end
