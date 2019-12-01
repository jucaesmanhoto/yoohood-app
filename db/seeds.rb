# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Destroying places...'
# Place.destroy_all

# puts 'Destroying events...'
# Event.destroy_all

# puts 'Destroying users...'
# User.destroy_all

# puts 'Creating fake Users...'
# 20.times do
#   User.create!(name: Faker::Name.name,
#                email: Faker::Internet.email,
#                password: 'password')
# end

# puts 'Creating fake Events...'
# 100.times do
#   @event = Event.create!(title: Faker::Name.name,
#                 description: "Solomun is back! Don't miss his next set in Sao Paulo.",
#                 # start_time: Faker::Time.forward(days: 23, period: :evening),
#                 start_time: Faker::Time.backward(days: 23, period: :evening),
#                 end_time: Faker::Time.forward(days: 23, period: :evening),
#                 user: User.all.sample
#                 )
#     Place.create!(name: Faker::Name.name,
#                 address: Faker::Address.street_address,
#                 event: @event
#                 )
#     puts "#{@event.title} created"
# end

puts 'Destroying events categories'
Category.destroy_all

puts 'Creating Categories'
category_attr = [{
  name: 'arts',
  color_hex: '#cc0000'
},{
  name: 'movies',
  color_hex: '#cc5500'
},{
  name: 'sports',
  color_hex: '#ccaa00'
},{
  name: 'gastronomics',
  color_hex: '#99cc00'
},{
  name: 'music',
  color_hex: '#44cc00'
},{
  name: 'fairs',
  color_hex: '#00cc11'
},{
  name: 'parties',
  color_hex: '#00cc66'
},{
  name: 'plays',
  color_hex: '#00ccbb'
},{
  name: 'workshops',
  color_hex: '#0088cc'
},{
  name: 'dances',
  color_hex: '#0033cc'
},{
  name: 'citizenship',
  color_hex: '#2200cc'
},{
  name: 'literaries',
  color_hex: '#cc00cc'
},{
  name: 'wellness',
  color_hex: '#cc0077'
}]

Category.create!(category_attr)
puts "#{Category.count} categories created"
