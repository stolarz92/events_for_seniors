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
  City.create([{
                   name: "Kraków",
                   description: "<p>Kraków należy do grona najpiękniejszych miast Europy.
Liczne walory turystyczne m. in. zabytki Krakowa oraz bogata oferta kulturalna miasta zostały już docenione na całym świecie.
W 2005 r. Kraków zajął 5 miejsce na liście najciekawszych miast Europy, przygotowanej przez prestiżowy magazyn „Travel and Leisure”.
Natomiast w 2006 r. amerykańska agencja Orbitz uznała gród Kraka za najmodniejsze miejsce na świecie.</p>

<h3>Co zobaczyć w Krakowie.</h3>

<p>Kraków jest centrum administracyjnym Małopolski oraz jednym z najważniejszych ośrodków gospodarczych, naukowych i kulturalnych kraju.
 do 1795 r. Kraków był oficjalną stolicą Polski, a przypominają o tym liczne w mieście zabytki.</p>
<p>Większość z nich usytuowana jest wokół słynnej Drogi Królewskiej, która rozpoczyna się na Kleparzu, wiedzie obok pozostałości średniowiecznych fortyfikacji –
Bramy Floriańskiej, Barbakanu, baszt obronnych – dalej biegnie ulicą Floriańską aż na Rynek Główny, gdzie mija kościół Mariacki i Sukiennice,
a następnie ulicą Grodzką dochodzi do Wzgórza Wawelskiego, gdzie usytuowany jest Zamek Królewski i Katedra Wawelska. Krakowska Via Regia przecina Planty –
najbardziej reprezentacyjny park miasta, a wokół niej zlokalizowane jest także słynne Muzeum Książąt Czartoryskich,
Teatr Stary im. Heleny Modrzejewskiej oraz zabytkowe budynki Uniwersytetu Jagiellońskiego, w tym najstarsze Collegium Maius.
W Krakowie istniała również przez wieki znacząca gmina żydowska.</p>
<p>Obszar zamieszkiwany przez Żydów – Krakowski
Kazimierz – jest dziś miejscem, gdzie tradycja wspaniale współgra z nowoczesnością, gdzie w sąsiedztwie pięknych synagog funkcjonują popularne kawiarnie i kluby.
 Na obszarze Kazimierza zlokalizowany jest też jeden z najznamienitszych panteonów narodowych – Krypta Zasłużonych na Skałce oraz słynna Fabryka Schindlera,
której dzieje opowiedział w 1993 r. Steven Spielberg w filmie „Lista Schindlera”.</p>
<p> W ostatnich latach Kraków stał się miejscem licznych pielgrzymek.
Katolicy odwiedzają przede wszystkim Sanktuarium Bożego Miłosierdzia w Łagiewnikach i podchodzą pod „okno papieskie” Pałacu Biskupiego – miejsce, w którym mieszkał
niegdyś Karol Wojtyła i skąd, już jako papież, prowadził on wielogodzinne rozmowy z wiernymi.</p>",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/krakow.jpg")
               },
               {
                   name: "Warszawa",
                   description: "",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/warszawa.jpg")
               },
               {
                   name: "Wrocław",
                   description: "",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/wroclaw.jpg")
               },
               {
                   name: "Poznań",
                   description: "",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/poznan.jpg")
               },
               {
                   name: "Gdańsk",
                   description: "",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/gdansk.jpg")
               }])
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

create_admin
create_user
create_categories
create_cities
create_events
create_relationships