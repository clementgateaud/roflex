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
require "geocoder"


p "Destroying all rentals..."
Rental.destroy_all
p "All rentals are deleted"

p "Destroying all offers..."
Offer.destroy_all
p "All offers are deleted"

p "Destroying all users..."
User.destroy_all
p "All users are deleted"

p "Creating users..."
user1 = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
file1 = URI.open("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user1.photo.attach(io: file1, filename: 'a.png', content_type: 'image/png')

user2 = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
file2 = URI.open("https://images.unsplash.com/photo-1618077360395-f3068be8e001?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user2.photo.attach(io: file2, filename: 'a.png', content_type: 'image/png')

user3 = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
file3 = URI.open("https://images.unsplash.com/photo-1518577915332-c2a19f149a75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGJ1c2luZXNzJTIwd29tYW58ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user3.photo.attach(io: file3, filename: 'a.png', content_type: 'image/png')

user4 = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
file4 = URI.open("https://images.unsplash.com/photo-1567336273898-ebbf9eb3c3bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHdvbWFufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user4.photo.attach(io: file4, filename: 'a.png', content_type: 'image/png')

user5 = User.create(username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number,
  password:'adminadmin')
file5 = URI.open("https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJsYWNrJTIwbWFufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user5.photo.attach(io: file5, filename: 'a.png', content_type: 'image/png')

p "#{User.count} users are created"

# html = URI.open("https://www.etsy.com/search?q=rolex").read
# doc = Nokogiri::HTML(html, nil, "utf-8")
# doc.search(".wt-width-full.wt-height-full.wt-display-block.wt-position-absolute").first(10).each do |element|
#   file = URI.open(element.attributes["src"])
#   address = Faker::Address.country
#   while address.nil?
#     address = Faker::Address.country
#   end
#   offer = Offer.create!(name: Faker::Commerce.product_name, price: rand(20..500).round(2), description: Faker::Lorem.paragraph,
#  availability: true, user: User.all.sample, address: address, latitude: Geocoder.coordinates(address)[0], longitude: Geocoder.coordinates(address)[1])
#   offer.photo.attach(io: file, filename: 'a.png', content_type: 'image/png')
# end

p "Creating offers..."

address1 = "Antibes"
offer1 = Offer.create(name: "Rolex Submariner", price: "499€", user: User.all.sample, description: "The Oyster Perpetual Submariner in Oystersteel with a Cerachrom bezel insert in black ceramic and a black dial with large luminescent hour markers.", address: address1, latitude: Geocoder.coordinates(address1)[0], longitude: Geocoder.coordinates(address1)[1])
offer1.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/cellini/m50535-0002_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address2 = "Paris"
offer2 = Offer.create(name: "Rolex Explorer", price: "357€", user: User.all.sample, description: "The Oyster Perpetual Explorer in Oystersteel and yellow gold features a distinctive black dial with characteristic 3, 6, and 9 numerals with a Chromalight display.", address: address2, latitude: Geocoder.coordinates(address2)[0], longitude: Geocoder.coordinates(address2)[1])
offer2.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/milgauss/m116400gv-0002_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address3 = "Marseille"
offer3 = Offer.create(name: "Rolex Cosmograph Daytona", price: "456€", user: User.all.sample, description: "This Oyster Perpetual Cosmograph Daytona in 18 ct Everose gold, with a meteorite and black dial and an Oyster bracelet, features an 18 ct Everose gold bezel with engraved tachymetric scale.", address: address3, latitude: Geocoder.coordinates(address3)[0], longitude: Geocoder.coordinates(address3)[1])
offer3.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/sky-dweller/m326238-0009_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address4 = "Dijon"
offer4 = Offer.create(name: "Rolex Sky-dweller", price: "235€", user: User.all.sample, description: "The Oyster Perpetual Sky-Dweller in 18 ct Everose gold with an intense white dial and an Oyster bracelet. This distinctive watch is characterized by its second time zone display on an off-centre disc on the dial.", address: address4, latitude: Geocoder.coordinates(address4)[0], longitude: Geocoder.coordinates(address4)[1])
offer4.photo.attach(io: URI.open('https://content.rolex.com//dam/new-watches-2021/media/wallpapers/explorer/m124273-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address5 = "Rouen"
offer5 = Offer.create(name: "Rolex Explorer II", price: "673€", user: User.all.sample, description: "This Oyster Perpetual Explorer II in Oystersteel with an Oyster bracelet features a white dial with an arrow-shaped 24-hour hand and hour markers with a Chromalight display.", address: address5, latitude: Geocoder.coordinates(address5)[0], longitude: Geocoder.coordinates(address5)[1])
offer5.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/sea-dweller/m126603-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address6 = "Lille"
offer6 = Offer.create(name: "Rolex Cellini", price: "428€", user: User.all.sample, description: "The Cellini collection celebrates the eternal elegance of traditional timepieces with a contemporary touch; the name was inspired by the Italian Renaissance artist, Benvenuto Cellini.", address: address6 ,latitude: Geocoder.coordinates(address6)[0], longitude: Geocoder.coordinates(address6)[1])
offer6.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/lady-datejust/m279138rbr-0015_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address7 = "Toulouse"
offer7 = Offer.create(name: "Rolex Yacht Master II", price: "300€", user: User.all.sample, description: "The Oyster Perpetual Yacht-Master II in Oystersteel and Everose gold with an Oyster bracelet and a bidirectional rotatable bezel with a blue Cerachrom insert.", address: address7, latitude: Geocoder.coordinates(address7)[0], longitude: Geocoder.coordinates(address7)[1])
offer7.photo.attach(io: URI.open('https://content.rolex.com//dam/new-watches-2021/media/wallpapers/cosmograph-daytona/m116519ln-0038_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address8 = "Lyon"
offer8 = Offer.create(name: "Rolex Day date", price: "279€", user: User.all.sample, description: "Launched in 1956, the Day-Date made its debut as the first waterproof and self-winding chronometer wristwatch to offer a modern calendar with an instantaneous day display, spelt out in full in a window on the dial, in addition to the date.", address: address8,latitude: Geocoder.coordinates(address8)[0], longitude: Geocoder.coordinates(address8)[1])
offer8.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/air-king/m116900-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address9 = "Deauville"
offer9 = Offer.create(name: "Rolex Milgauss", price: "970€", user: User.all.sample, description: "This Oyster Perpetual Milgauss features a Z-blue dial with luminescent hour markers, a green sapphire crystal produces light reflections while preserving optimal legibility.", address: address9 ,latitude: Geocoder.coordinates(address9)[0], longitude: Geocoder.coordinates(address9)[1])
offer9.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/oyster-perpetual/m124300-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address10 = "Bordeaux"
offer10 = Offer.create(name: "Rolex Air-king", price: "147€", user: User.all.sample, description: "With its 40 mm case in Oystersteel, solid-link Oyster bracelet with Oysterclasp, and distinctive Black dial, the Air-King perpetuates the aeronautical heritage of the original Rolex Oyster.", address: address10, latitude: Geocoder.coordinates(address10)[0], longitude: Geocoder.coordinates(address10)[1])
offer10.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/submariner/m124060-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

p "#{Offer.count} offers are created"

# 3.times do
#   Rental.create!(start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#   end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), total_amount: rand(0.0..100.0).round(1),
#   user: User.all.sample, offer: Offer.all.sample)
# end

p "Creating admin..."

admin = User.create(username: "jeanmicheladmin", first_name: "Jean-Michel", last_name: "Admin",
  email: "admin@gmail.com", phone_number: "0600000000",
  password:'adminadmin')
fileadmin = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShN0nuLT7HIpIANuDi6wbMKpeuCgZsl2PtAA&usqp=CAU")
admin.photo.attach(io: fileadmin, filename: 'a.png', content_type: 'image/png')

p "Admin created"
