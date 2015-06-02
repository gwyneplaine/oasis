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

u1 = User.create :name => 'Charles', :username => 'tetrisburger'
u2 = User.create :name => 'James', :username => 'jimbo'

e1 = Event.create :name => 'Sydney Harbour Rave'
e2 = Event.create :name => 'Death: The new Bounce'
e3 = Event.create :name => 'Upstaged 2015'

l1 = Location.create :name => 'Sydney Harbour Bridge'
l2 = Location.create :name => 'Shark Hotel'
l3 = Location.create :name => 'Seymour Centre'

l1.events << e1
l2.events << e2
l3.events << e3