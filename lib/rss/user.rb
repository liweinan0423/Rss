module Rss
  class User
  	attr_accessor :username, :full_name, :group

  	def initialize(username, full_name, group)
  	  self.username = username
  	  self.full_name =full_name
  	  self.group = group
  	end
  end
end