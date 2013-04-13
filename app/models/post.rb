class Post < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :content, :title
end
