# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying places...'
Place.destroy_all

puts 'Destroying events...'
Event.destroy_all

puts 'Destroying users...'
User.destroy_all

puts 'Creating fake Users...'
20.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'password')
end

puts 'Creating fake Events...'
100.times do
  Event.create!(title: Faker::Name.name,
                description: "Solomun is back! Don't miss his next set in Sao Paulo.",
                # start_time: Faker::Time.forward(days: 23, period: :evening),
                start_time: Faker::Time.backward(days: 23, period: :evening),
                end_time: Faker::Time.forward(days: 23, period: :evening),
                user: User.all.sample
                )
end

puts 'Creating fake places...'
20.times do
  Place.create!(name: Faker::Name.name,
                address: Faker::Address.street_address,
                event: Event.find(Event.first.id..Event.last.id)
                )
end
