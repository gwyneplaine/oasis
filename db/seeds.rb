# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Location.destroy_all
Event.destroy_all
Category.destroy_all
Timeline.destroy_all


# u1 = User.create :name => 'Charles', :username => 'tetrisburger'
# u2 = User.create :name => 'James', :username => 'jimbo'

e1 = Event.create :name => 'Sydney Harbour Rave', :address => '20 York St Sydney',:image =>'http://placekitten.com/1280/800'
e2 = Event.create :name => 'Death: The new Bounce', :address => '25 York St Sydney',:image =>'http://placekitten.com/1280/800'
e3 = Event.create :name => 'Upstaged 2015', :address => '33 York St Sydney',:image =>'http://placekitten.com/1280/800'
e4 = Event.create :name => 'Volcano Rave', :address => '19 Barana Parade Roseville Chase',:image =>'http://placekitten.com/1280/800'
e5 = Event.create :name => 'Dead Cat Lovers Meetup ', :address => 'Sydney Opera House',:image =>'http://placekitten.com/1280/800'

l1 = Location.create :name => 'Sydney Harbour Bridge', :address => Geocoder.address('20 York St Sydney')
l2 = Location.create :name => 'Shark Hotel', :address => Geocoder.address('25 York St Sydney')
l3 = Location.create :name => 'Seymour Centre', :address => Geocoder.address('33 York St Sydney')
l4 = Location.create :name => 'Home', :address => Geocoder.address('19 Barana Parade Roseville Chase')
l5 = Location.create :name => 'Home', :address => Geocoder.address('Sydney Opera House')

l1.events << e1
l2.events << e2
l3.events << e3
l4.events << e4
l5.events << e5