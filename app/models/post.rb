class Post < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :content, :title

  validates :title, :content, :presence => true
end
