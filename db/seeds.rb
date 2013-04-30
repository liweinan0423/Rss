# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



images = %w{db/seeds/4.jpg db/seeds/3.jpg} 


hr_channel = Channel.create	:name => 'HR', :description => 'HR Channel'
tec_channel = Channel.create :name => 'TEC',:description => 'TEC Channel'
admin_channel = Channel.create :name => 'Admin', :description => 'Admin Channel'


hr_channel.posts.create([
	{:title => 'article1', :content => 'article1', :image => IO.binread(images[0]) },
	{:title => 'article2', :content => 'article2', :image => IO.binread(images[1]) }
])

tec_channel.posts.create([
	{:title => 'article1', :content => 'article1', :image => IO.binread(images[0]) },
	{:title => 'article2', :content => 'article2', :image => IO.binread(images[1]) }
])

admin_channel.posts.create([
	{:title => 'article1', :content => 'article1', :image => IO.binread(images[0]) },
	{:title => 'article2', :content => 'article2', :image => IO.binread(images[1]) }
])