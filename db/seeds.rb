# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.create([{ name: "Kraków"}, {name: "Warszawa"}, {name: "Wrocław"}])
Category.create([{name: "Teatr"}, {name: "Wystawa"},{name: "Jedzenie"}])

Faker::Config.locale = :pl

50.times do |n|
  name = Faker::Lorem.word
  description = Faker::Lorem.paragraph(2)
  start_date = Faker::Date.backward(1).strftime("%d-%m-%Y")
  end_date = Faker::Date.forward(2).strftime("%d-%m-%Y")
  starts_at = Faker::Time.forward(30, :morning).strftime("%H:%M:S")
  ends_at = Faker::Time.forward(30, :night).strftime("%H:%M:S")
  location = Faker::Address.street_name
  website = Faker::Internet.url
  cost = Faker::Number.number(7)
  contact = Faker::PhoneNumber.phone_number
  category_id = [1,2,3].sample
  city_id = [1,2,3].sample
  image = [
      "/home/epi/12_stolarski/obrazy/DP-500S-01.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-02.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-03.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-04.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-05.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-06.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-07.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-08.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-09.jpg",
      "/home/epi/12_stolarski/obrazy/DP-500S-010.jpg",
  ].sample
  Event.create!(name: name,
                description: description,
                start_date: start_date,
                end_date: end_date,
                starts_at: starts_at,
                ends_at: ends_at,
                location: location,
                city_id: city_id,
                category_id: category_id,
                website: website,
                cost: cost,
                contact: contact,
                image: File.new(image)
  )
end
