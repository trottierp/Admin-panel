# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Starting ......... "
puts "adding data  "
500.times do
    
    Form.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, phone: Faker::Number.unique.number(digits: 9), job: Faker::Job.unique.title , address: Faker::Address.unique.street_address , country: Faker::Address.country  )
 end

 200.times do
    Music.create(band: Faker::Music.band, album: Faker::Music.album, genre: Faker::Music.genre )
 end

 100.times do
    
    Movie.create(title: Faker::Movie.unique.title, quote: Faker::Movie.quote )
 end

 100.times do
    
    User.create(first_name: Faker::Name.unique.first_name,last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password_digest: Faker::Number.unique.number(digits: 9), avatar_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") )
 end
  
    User.create(email: "admin@test.com", password: "test", first_name: "Admin", last_name: "User", avatar_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"))

puts "Success: data loaded"