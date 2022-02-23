# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
require "nokogiri"

3.times do
  user = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
  file = URI.open(Faker::Avatar.image)
  user.photo.attach(io: file, filename: 'a.png', content_type: 'image/png')
end

html = URI.open("https://www.etsy.com/search?q=rolex").read
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search(".wt-width-full.wt-height-full.wt-display-block.wt-position-absolute").first(30).each do |element|
  file = URI.open(element.attributes["src"])
  offer = Offer.create!(name: Faker::Commerce.product_name, price: rand(0.0..100.0).round(1), description: Faker::Lorem.paragraph,
  availability: true, user: User.all.sample)
  offer.photo.attach(io: file, filename: 'a.png', content_type: 'image/png')
end

3.times do
  Rental.create!(start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), total_amount: rand(0.0..100.0).round(1),
  user: User.all.sample, offer: Offer.all.sample)
end
