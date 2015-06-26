# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_admin
  User.create!(
      email: 'admin@example.com',
      password: 'password',
      password_confirmation: 'password',
      admin: true
  )
end

def create_user
  5.times do
    User.create!(
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password',
        admin: false
    )
  end
  User.create!(
      email: 'test@test.pl',
      password: 'password',
      password_confirmation: 'password',
      admin: false
  )
end
def create_cities
  City.create([{ name: "Kraków", image: File.new("/home/epi/12_stolarski/obrazy/miasta/krakow.jpg")},
               {name: "Warszawa", image: File.new("/home/epi/12_stolarski/obrazy/miasta/warszawa.jpg")},
               {name: "Wrocław", image: File.new("/home/epi/12_stolarski/obrazy/miasta/wroclaw.jpg")},
               {name: "Poznań", image: File.new("/home/epi/12_stolarski/obrazy/miasta/poznan.jpg")},
               {name: "Gdańsk", image: File.new("/home/epi/12_stolarski/obrazy/miasta/gdansk.jpg")}])
end

def create_categories
  Category.create([{name: "Teatr"},
                   {name: "Wystawa"},
                   {name: "Jedzenie"},
                   {name: "Koncert"},
                   {name: "Wydarzenie uliczne"},
                   {name: "Sport"}
                  ])

  Faker::Config.locale = :pl
end

def create_events
  300.times do |n|
    name = Faker::Lorem.sentence
    description = Faker::Lorem.paragraph(10)
    start_date = Faker::Date.between(Date.today, Date.today + 7.days).strftime("%d-%m-%Y")
    end_date = Faker::Date.between(Date.today + 7.days, Date.today + 10.days).strftime("%d-%m-%Y")
    starts_at = Faker::Time.forward(30, :morning).strftime("%H:%M:S")
    ends_at = Faker::Time.forward(30, :night).strftime("%H:%M:S")
    location = Faker::Address.street_name
    website = Faker::Internet.url
    cost = [1,2].sample
    contact = Faker::PhoneNumber.phone_number
    category_id = [1,2,3,4,5,6].sample
    city_id = [1,2,3,4,5].sample
    effort = [1,2,3].sample
    image =
        ["/home/epi/12_stolarski/obrazy/DP-500S-01.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-02.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-03.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-04.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-05.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-06.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-07.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-08.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-09.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-10.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-11.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-12.jpg",
        "/home/epi/12_stolarski/obrazy/DP-500S-13.jpg"].sample
    user_id = [1,2,3,4,5].sample
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
                  image: File.new(image),
                  effort: effort,
                  user_id: user_id
    )
  end
end

def create_relationships
  users = User.all
  events = Event.all

  users.each do |user|
    events.each do |event|
      user.follow(event)
    end
  end

end

# create_admin
# create_user
# create_categories
# create_cities
# create_events
create_relationships