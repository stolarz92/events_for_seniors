# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#City.create([{ name: "Kraków"}, {name: "Warszawa"}, {name: "Wrocław"}])
#Category.create([{name: "Teatr"}, {name: "Wystawa"},{name: "Jedzenie"}])

Faker::Config.locale = :pl

50.times do |n|
  name = Faker::Lorem.word
  description = Faker::Lorem.paragraph(2)
  start_date = Faker::Date.backward(1).strftime("%d-%m-%Y")
  end_date = Faker::Date.forward(2).strftime("%d-%m-%Y")
  starts_at = Faker::Time.forward(30, :morning).strftime("%H:%M:S")
  ends_at = Faker::Time.forward(30, :night).strftime("%H:%M:S")
  location = Faker::Address.street_name
  city_id = [1,2,3].sample
  Event.create!(name: name,
               description: description,
               start_date: start_date,
               end_date: end_date,
               starts_at: starts_at,
               ends_at: ends_at,
               location: location,
               city_id: city_id
  )
end
