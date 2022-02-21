# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

3.times do
  User.create!(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, profile_picture_url: Faker::Avatar.image,
  address: Faker::Address.street_address, password:'adminadmin')
end

3.times do
  Offer.create!(name: Faker::Commerce.product_name, price: rand(0.0..100.0).round(1),description: Faker::Lorem.paragraph,
  availability: true, photo_url: Faker::LoremFlickr.image, user: User.all.sample)
end

3.times do
  Rental.create!(start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), total_amount: rand(0.0..100.0).round(1),
  user: User.all.sample, offer: Offer.all.sample)
end
