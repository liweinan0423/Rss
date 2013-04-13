class Subscription < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :username
end
