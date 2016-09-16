# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_admin
  User.create!(
      email: 'admin@admin.com',
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
      email: 'user@user.pl',
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
a następnie ulicą Grodzką dochodzi do Wzgórza Wawelskiego, gdzie usytuowany jest Zamek Królewski i Katedra Wawelska. </p>",
                   image: File.new(Rails.root + "app/assets/images/city_images/krakow.jpg")
               },
               {
                   name: "Warszawa",
                   description: "<p>Serdecznie zapraszamy do Warszawy - stolicy Polski - miasta,
które warto zobaczyć.</p>

<p>Zachęcamy do poznania miasta pełnego kontrastów.
Tutaj po wojennych zniszczeniach zabytkowe pałace, kościoły, gmachy i zespoły architektoniczne zrekonstruowano
z wielką pieczołowitością. Dziś budowle historyczne sąsiadują z nowoczesną architekturą.
 Warszawskie zabytki i pamiątki z przeszłości zostały docenione przez UNESCO,
dzięki czemu warszawska Starówka została uhonorowana wpisem na listę Światowego Dziedzictwa Kulturowego.</P>

<p>Zwiedzanie miasta można doskonale połączyć z uczestnictwem w którymś z wydarzeń kulturalnych:
niezapomniane wrażenia pozostawiają plenerowe koncerty fortepianowe, odbywające się przy pomniku
Chopina w Łazienkach. Co roku stolica gości wykonawców o ustalonej światowej renomie,
 biorących udział w międzynarodowych festiwalach i konkursach, na przykład w Międzynarodowym Konkursie Pianistycznym
 im. Fryderyka Chopina, Międzynarodowym Festiwalu Muzyki Współczesnej \"Warszawska Jesień\", \"Jazz Jamboree\"
czy Warsaw Summer Jazz Days.</p>",
                   image: File.new(Rails.root + "app/assets/images/city_images/warszawa.jpg")
               },
               {
                   name: "Wrocław",
                   description: "<p>
Wrocław jest jednym z najstarszych i najpiękniejszych miast w Polsce.
Charakterystyczny krajobraz centrum miasta, rozłożonego na wysepkach i obu brzegach Odry,
zapewnił miastu miano Polskiej Wenecji. Wrocław jest miastem o silnej tożsamości akademickiej,
nastawionym na młodość i edukację. Jego klimat tworzą w głównej mierze studenci szkół wyższych,
których we Wrocławiu jest ponad 30.
</p>
<p>
Wrocław jest miastem o bogatej i burzliwej historii. Czasy wczesnego średniowiecza przypomina Ostrów Tumski,
 na którym zachował się w doskonałym stanie jeden z najpiękniejszych w Europie zespołów architektury sakralnej.
 Innym pięknym zabytkiem z tego okresu jest wrocławski Ratusz, zaliczany do najwspanialszych budowli gotyckich
 w Europie Środkowej.
</p>
<p>
W centrum miasta rozpościera się Park Szczytnicki, w którym rośnie 350 gatunków drzew i krzewów oraz znajduje się
unikatowy Ogród Japoński, stworzony i pielęgnowany zgodnie z zasadami japońskiej sztuki ogrodniczej.</p>",
                   image: File.new(Rails.root + "app/assets/images/city_images/wroclaw.jpg")
               },
               {
                   name: "Poznań",
                   description: "
<p>
Poznańska ziemia pamięta zarówno dawnych władców Polski, jak i czasy bujnego rozkwitu miasta w szesnastym wieku.
Ogromne, reprezentacyjne gmachy współistnieją tu z urokliwymi kamieniczkami, a szerokie, ruchliwe ulice z
przepięknymi zakątkami, wypełniającymi Stare Miasto.
</p>
<p>Poznań pełen jest interesujących miejsc. Na Starym Rynku można znaleźć słynny renesansowy ratusz,
a nad Rynkiem góruje Zamek Królewski. Innym ważnym miejscem jest Ostrów Tumski, który jest najstarszą częścią
miasta - znajduje się tu najstarsza w kraju katedra, w której podobno odbył się chrzest Polski.
</p>
<p>
Poznań współczesny to tętniąca życiem metropolia, miasto kultury i rozrywki.
130 tysięcy studentów daje miastu niesamowitą energię, zapełniając wieczorami liczne puby, kafejki i kluby,
gdzie zabawa trwa zawsze do rana! Międzynarodowe festiwale - jak słynna poznańska Malta, festyny -
jak Dni Świętomarcińskie, happeningi, koncerty, wystawy w muzeach i galeriach, spektakle.</p>",
                   image: File.new(Rails.root + "app/assets/images/city_images/poznan.jpg")
               },
               {
                   name: "Gdańsk",
                   description: "<p>Gdańsk – stolica województwa pomorskiego oraz jedno z większych miast Polski.
Pod względem zajmowanej powierzchni jest siódmym miastem w kraju, natomiast ze względu na liczbę ludności szóstym.
Gdańsk położony jest nad Zatoką Gdańską. Razem z Gdynią i Sopotem tworzy Trójmiasto.
Założony w 997 r., otrzymał prawa miejskie w 1263 r. Jako hanzeatyckie miasto portowe,
Gdańsk bardzo dynamicznie rozwijał się, zarówno pod względem gospodarczym jak i kulturalnym.
Swego czasu stał się najbogatszym miastem Polski, czego efekty widać do dziś.</p>
Do najważniejszych zabytków Gdańska można zaliczyć:
<ul>
<li>Drogę Królewską,</li>
<li>Ratusz Głównego Miasta,</li>
<li>Ratusz Starego Miasta,</li>
<li>Bazylikę Mariacką, która jest największą ceglaną świątynią w Europie,</li>
<li>Dwór Artusa,</li>
<li>Fontanna Neptuna,</li>
<li>Złota Kamienica,</li>
<li>27–metrowa Latarnia Morska</li>
<li>oraz Żuraw – najstarszy zachowany dźwig w Europie.</li>
</ul>",
                   image: File.new(Rails.root + "app/assets/images/city_images/gdansk.jpg")
               }])
end

def create_cost
  Cost.create(
      [
          {name: 'Płatne'},
          {name: 'Bezpłatne'}
      ]

  )
end

def create_effort
  Effort.create(
      [
          {name: 'Mały'},
          {name: 'Średni'},
          {name: 'Duży'}

      ]

  )
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
  500.times do |n|
    name = Faker::Lorem.sentence(2)
    description = Faker::Lorem.paragraph(10)
    start_date = Faker::Date.between(2.days.ago, Date.today + 7.days).strftime("%d-%m-%Y")
    end_date = Faker::Date.between(Date.today + 7.days, Date.today + 10.days).strftime("%d-%m-%Y")
    starts_at = Faker::Time.forward(1, :day).strftime("%H:%M:S")
    ends_at = Faker::Time.forward(1, :night).strftime("%H:%M:S")
    location = Faker::Address.street_name
    website = Faker::Internet.url
    cost_id = [1,2].sample
    contact = Faker::PhoneNumber.phone_number
    category_id = [1,2,3,4,5,6].sample
    city_id = [1,2,3,4,5].sample
    effort_id = [1,2,3].sample
    image =
        [
            Rails.root + "app/assets/images/sample_events_images/klif.jpg",
            Rails.root + "app/assets/images/sample_events_images/morze.jpg",
            Rails.root + "app/assets/images/sample_events_images/ny.jpg",
            Rails.root + "app/assets/images/sample_events_images/wall.jpg",
        ].sample
    user_id = [1,2,3,4,5,6,7].sample
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
                  cost_id: cost_id,
                  contact: contact,
                  image: File.new(image),
                  effort_id: effort_id,
                  user_id: user_id
    )
  end
end

def create_relationships
  users = User.all
  events = Event.all.sample(17)

  users.each do |user|
    events.each do |event|
      user.follow(event)
    end
  end

end

create_admin
create_user
create_categories
create_cost
create_effort
create_cities
create_events
create_relationships
