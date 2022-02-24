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
offer1 = Offer.create!(name: "Submariner", price: "499€", user: User.all.sample, description: "L’Oyster Perpetual Submariner en Acier Oystersteel est dotée d’un disque de lunette Cerachrom en céramique noire et d’un cadran noir, ainsi que de grands index luminescents.", address: address1, latitude: Geocoder.coordinates(address1)[0], longitude: Geocoder.coordinates(address1)[1])
offer1.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/cellini/m50535-0002_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address2 = "Paris"
offer2 = Offer.create!(name: "Explorer", price: "357€", user: User.all.sample, description: "Les reflets de lumière sur les flancs de carrure mettent en valeur les formes raffinées de son boîtier Oyster, réalisé en acier Oystersteel, de respectivement 41 mm ou 36 mm de diamètre et surmonté d’une lunette bombée.", address: address2, latitude: Geocoder.coordinates(address2)[0], longitude: Geocoder.coordinates(address2)[1])
offer2.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/milgauss/m116400gv-0002_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address3 = "Marseille"
offer3 = Offer.create!(name: "Cosmograph Daytona", price: "456€", user: User.all.sample, description: "L’Oyster Perpetual Cosmograph Daytona est la montre-outil de référence des passionnés d’automobile et de vitesse.", address: address3, latitude: Geocoder.coordinates(address3)[0], longitude: Geocoder.coordinates(address3)[1])
offer3.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/sky-dweller/m326238-0009_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address4 = "Dijon"
offer4 = Offer.create!(name: "Sky-dweller", price: "235€", user: User.all.sample, description: "Première montre de la catégorie Classique munie de cet innovant bracelet en élastomère haute performance, cette déclinaison s’habille d’un cadran noir vif finition soleil avec aiguilles et index en or jaune 18 ct.", address: address4, latitude: Geocoder.coordinates(address4)[0], longitude: Geocoder.coordinates(address4)[1])
offer4.photo.attach(io: URI.open('https://content.rolex.com//dam/new-watches-2021/media/wallpapers/explorer/m124273-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address5 = "Rouen"
offer5 = Offer.create!(name: "Explorer", price: "673€", user: User.all.sample, description: "Des explorateurs, alpinistes et scientifiques parmi les plus intrépides ont éprouvé la fiabilité des montres Explorer et Explorer II dans des endroits aux conditions les plus extrêmes.", address: address5, latitude: Geocoder.coordinates(address5)[0], longitude: Geocoder.coordinates(address5)[1])
offer5.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/sea-dweller/m126603-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address6 = "Lille"
offer6 = Offer.create!(name: "GMT-Master II", price: "428€", user: User.all.sample, description: "Conçue pour afficher simultanément l’heure de deux fuseaux horaires, la GMT‑Master, qui a vu le jour en 1955, a été développée comme un instrument d’aide à la navigation pour les professionnels appelés à sillonner le monde.", address: address6 ,latitude: Geocoder.coordinates(address6)[0], longitude: Geocoder.coordinates(address6)[1])
offer6.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/lady-datejust/m279138rbr-0015_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address7 = "Toulouse"
offer7 = Offer.create!(name: "Yacht Master", price: "300€", user: User.all.sample, description: "Témoin des liens privilégiés qui unissent Rolex et le monde de la voile depuis les années 1950, la Yacht‑Master conjugue avec brio fonctionnalité et style nautique, tandis que la Yacht‑Master II propose un concentré de technologie Rolex à l’avant‑garde de l’art horloger dans un chronographe de régate conçu pour la voile de compétition.", address: address7, latitude: Geocoder.coordinates(address7)[0], longitude: Geocoder.coordinates(address7)[1])
offer7.photo.attach(io: URI.open('https://content.rolex.com//dam/new-watches-2021/media/wallpapers/cosmograph-daytona/m116519ln-0038_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address8 = "Lyon"
offer8 = Offer.create!(name: "Day date", price: "279€", user: User.all.sample, description: "À sa création en 1956, la Day-Date est la première montre-bracelet chronomètre, étanche et automatique à offrir un calendrier moderne affichant instantanément le jour en toutes lettres et la date dans des guichets sur le cadran.", address: address8,latitude: Geocoder.coordinates(address8)[0], longitude: Geocoder.coordinates(address8)[1])
offer8.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/air-king/m116900-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address9 = "Deauville"
offer9 = Offer.create!(name: "Milgauss", price: "970€", user: User.all.sample, description: "Première montre de ce type, elle se démarque par son esthétique unique et par son héritage scientifique. ", address: address9 ,latitude: Geocoder.coordinates(address9)[0], longitude: Geocoder.coordinates(address9)[1])
offer9.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/oyster-perpetual/m124300-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

address10 = "Bordeaux"
offer10 = Offer.create!(name: "Air-king", price: "147€", user: User.all.sample, description: "La Rolex Air-King rend hommage aux pionniers de l’aviation et au rôle des montres Oyster dans l’épopée aérienne.", address: address10, latitude: Geocoder.coordinates(address10)[0], longitude: Geocoder.coordinates(address10)[1])
offer10.photo.attach(io: URI.open('https://content.rolex.com//dam/media/wallpapers/submariner/m124060-0001_1280x768.jpg'), filename: 'a.png', content_type: 'image/png')

p "#{Offer.count} offers are created"

# 3.times do
#   Rental.create!(start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#   end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), total_amount: rand(0.0..100.0).round(1),
#   user: User.all.sample, offer: Offer.all.sample)
# end
