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
a następnie ulicą Grodzką dochodzi do Wzgórza Wawelskiego, gdzie usytuowany jest Zamek Królewski i Katedra Wawelska. </p>
<p>Krakowska Via Regia przecina Planty –
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
czy Warsaw Summer Jazz Days.</p>

<p>Warszawa jest dobrze przygotowana na przyjęcie gości.
W około 200 obiektach na turystów czeka 20 tys. miejsc noclegowych, przy czym zarówno standard,
jak i formy noclegów dostosowano do różnych potrzeb i warunków finansowych gości.
Tak, więc obok hoteli o zróżnicowanym standardzie na turystów czekają także schroniska i kampingi</p>

<p>Zabudowa wielkomiejska współistnieje z otwartą przestrzenią skwerów, parków i ogrodów.
Tętniąca życiem metropolia bez trudu odnajduje się w Europie. Pozostawia niezapomniane wrażenia gościom i
oferuje szanse tym, którzy zdecydują się zostać tu na dłużej.</p>",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/warszawa.jpg")
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
unikatowy Ogród Japoński, stworzony i pielęgnowany zgodnie z zasadami japońskiej sztuki ogrodniczej.
 Równie interesującym miejscem spacerów jest wrocławski Ogród Botaniczny, z jego niezwykłą wystawą kwiatów,
alpinarium oranżerią, i największą w Polsce kaktusiarnią, a także najsłynniejszy w Polsce Ogród Zoologiczny,
założony w 1865 roku.</p>
<p>
Wizytówką miasta są przede wszystkim międzynarodowe festiwale muzyczne.
Największy z nich to Międzynarodowy Festiwal 'Wratislavia Cantans'. We Wrocławiu odbywają się również: Festiwal 'Jazz nad Odrą',
Międzynarodowe Zaduszki Jazzowe, Dni Muzyki Starych Mistrzów, Przegląd Piosenki Aktorskiej, Wrocławskie Spotkania
 Teatrów Jednego Aktora i Małych Form Teatralnych, Międzynarodowy Festiwal Dialog Wroclaw. Słynne w Europie stały się również tworzone z rozmachem przedstawienia operowe organizowane w Hali Ludowej. Do atrakcji kulturalnych, które koniecznie należy poznać, należy niewątpliwie Panorama Racławicka - jest to monumentalna rotunda, w której mieści się panoramiczny obraz, który przedstawia bitwę pod Racławicami z 4 kwietnia 1794 r.
</p>
<p>Noclegi zapewniają liczne hotele we Wrocławiu, miasto oferuje również bogate zaplecze sportowo - rekreacyjne.
Wrocław to ośrodek sportów wodnych i turystyki rzecznej oraz ważny punkt na sportowej mapie Polski,
szczycący się tradycjami w koszykówce, zawodach żużlowych, piłce nożnej, strzelectwie.
 Do aktywnego formy wypoczynku zachęcają starannie pielęgnowane parki oraz stale wzrastająca ilość tras rowerowych.
 Atutem Wrocławia jest dobre połączenia z ośrodkami wczasowymi, uzdrowiskowymi i sportowymi położonymi w o
brębie Kotliny Kłodzkiej oraz Sudetów i Karkonoszy. Zwiększa to i tak już bogatą ofertę aktywnego wypoczynku
 we Wrocławiu i zaspokoi wymagania nawet najbardziej wybrednych turystów.</p>
",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/wroclaw.jpg")
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
jak Dni Świętomarcińskie, happeningi, koncerty, wystawy w muzeach i galeriach, spektakle.</p>

<p>Interesującym miejscem, które często odwiedzają turyści, jest ulica Półwiejska,
 na której znajduje się wiele restauracji i sklepów. Przy tej ulicy znajduje się również Stary Browar,
oficjalnie uznany za najpiękniejsze centrum handlowe na świecie przez międzynarodową fundację ICSC.</p>

<p>
Miłośnikom turystyki aktywnej Poznań oferuje pola golfowe,
pływalnie i baseny, korty tenisowe, kluby fitness, sztrzelnicę oraz lodowiska.
Fani sportu mogą pójść na mecz piłki nożnej - tutaj siedzibę ma pierwszoligowy klub Lech Poznań -
lub na mecz koszykówki, siatkówki, hokeja na trawie albo piłki ręcznej.
</p>

<p>Przez Poznań przebiegają ciekawe trasy turystyczne: europejski Szlak Romański,
Szlak Piastowski oraz Trasa Kórnicka. Wokół miasta wytyczony jest rowerowy \"Pierścień Poznański\"
połączony z centrum siedmioma szlakami dojazdowymi. Dla osób spragnionych obcowania z przyrodą swoje
podwoje otwierają dwa ogrody zoologiczne, ogród botaniczny, palmiarnia oraz zabytkowe parki.</p>",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/poznan.jpg")
               },
               {
                   name: "Gdańsk",
                   description: "<p>Gdańsk – stolica województwa pomorskiego oraz jedno z większych miast Polski.
Pod względem zajmowanej powierzchni jest siódmym miastem w kraju, natomiast ze względu na liczbę ludności szóstym.
Gdańsk położony jest nad Zatoką Gdańską. Razem z Gdynią i Sopotem tworzy Trójmiasto.
Założony w 997 r., otrzymał prawa miejskie w 1263 r. Jako hanzeatyckie miasto portowe,
Gdańsk bardzo dynamicznie rozwijał się, zarówno pod względem gospodarczym jak i kulturalnym.
Swego czasu stał się najbogatszym miastem Polski, czego efekty widać do dziś.</p>

<p>Gdańsk jest jednym z większych kurortów nadbałtyckich. Wzdłuż brzegu na odcinku o długości 23 km
rozpościera się plaża. Zorganizowano tutaj trzy kąpieliska oraz wybudowano molo o długości 130 m.
<p>Jednym z najatrakcyjniejszych miejsc nadmorskich jest Wyspa Sobieszewska, która jako
jedyna w Polsce powstała w wyniku działalności człowieka. Od 1994 r. posiada status wyspy ekologicznej,
który gwarantuje przyjazne człowiekowi otoczenie.
</p>
<p>
 Gdańsk otaczają malownicze tereny
Trójmiejskiego Parku Krajobrazowego (utworzonego w 1979 r.) o powierzchni ok. 20 tysięcy ha, a także wzgórza
i jeziora Szwajcarii Kaszubskiej. Turyści mogą wybrać się na spacer do Parku Oliwskiego,
w którym znajduje się wiele gatunków rzadkich drzew i roślin oraz Pałac Opatów wzniesiony w XVIII w.
 Warto również zwiedzić, zajmujący około 120 ha, ogród zoologiczny (znajdujący się w Gdańsku-Oliwie),
który jest jednym z największych w Polsce.
</p>
<p>
Jedną z bardziej interesujących atrakcji turystycznych miasta jest
położona w samym centrum przystań jachtowa Marina Gdańsk wybudowana w 1997 r. Odwiedza ją wiele jachtów zarówno
polskich, jak i zagranicznych. Miłośnicy sportów wodnych mogą korzystać z Zatoki Gdańskiej lub Opływu Motławy,
który został gruntownie wyremontowany i stał się przyjemnym miejscem do wędrówek,jazdy rowerem, a także wędkowania.
</p>
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
</ul>
<p> Gdańsk jest jednym z miast leżących na Europejskim Szlaku Gotyku Ceglanego.</p>
<p>
Gdańsk nazywa się Światową Stolicą Bursztynu.
Nieodłącznie z dziejami miasta związana jest sztuka bursztyniarska.
Po zniszczeniach spowodowanych wojnami, miastu udało się powrócić do tradycji
 i na powrót otworzyć warsztaty obróbki bursztynu. Dziś Gdańsk jest siedzibą Krajowej
Izby Gospodarczej Bursztynu i Międzynarodowego Stowarzyszenia Bursztynników,
a także gospodarzem największych na świecie targów bursztynu („AMBERIF” i „AMBERMART”).</p>",
                   image: File.new("/home/epi/12_stolarski/obrazy/miasta/gdansk.jpg")
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
  300.times do |n|
    name = Faker::Lorem.sentence(2)
    description = Faker::Lorem.paragraph(10)
    start_date = Faker::Date.between(Date.today, Date.today + 7.days).strftime("%d-%m-%Y")
    end_date = Faker::Date.between(Date.today + 7.days, Date.today + 10.days).strftime("%d-%m-%Y")
    starts_at = Faker::Time.forward(30, :morning).strftime("%H:%M:S")
    ends_at = Faker::Time.forward(30, :night).strftime("%H:%M:S")
    location = Faker::Address.street_name
    website = Faker::Internet.url
    cost_id = [1,2].sample
    contact = Faker::PhoneNumber.phone_number
    category_id = [1,2,3,4,5,6].sample
    city_id = [1,2,3,4,5].sample
    effort_id = [1,2,3].sample
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
create_cost
create_effort
create_cities
create_events
create_relationships