# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'


# # Destroy current data before creating new ones

puts "💣Erasing all current data...💣"
FavoriteEvent.destroy_all
Event.destroy_all
Tag.destroy_all
Category.destroy_all
Shop.destroy_all
User.destroy_all

# Create default user for the hopla team

puts "⏲ Creating Hoplette... ⏲"

first_name ="hoplette"
last_name ="hoplette"

email = "hoplette@hoplette.com"
password = "hoplette"
user = User.new(
  first_name: first_name,
  last_name: last_name,
  email: email,
  password: password
)
user.save!

puts "✨✨ Hoplette created !! ✨✨"

# initialize categories

puts "⏲ Initializing categories... ⏲"

categories = [
  divertissement = { name: "Divertissement", icon: "fas fa-theater-masks" },
  electronique = { name: "Electronique", icon: "fas fa-tv" },
  sante = { name: "Santé", icon: "fas fa-clinic-medical" },
  vetements = { name: "Vêtements", icon: "fas fa-tshirt" },
  jeux = { name: "Jeux", icon: "fas fa-gamepad" },
  fleuriste = { name: "Fleuriste", icon: "fas fa-leaf" },
  garage = { name: "Garage", icon: "fas fa-car" },
  caviste = { name: "Caviste", icon: "fas fa-wine-bottle" },
  maroquinerie = { name: "Maroquinerie", icon: "fas fa-briefcase" },
  quincaillerie = { name: "Quincaillerie", icon: "fas fa-tools" },
  alimentation = { name: "Alimentation", icon: "fas fa-mortar-pestle" },
  esthetique = { name: "Esthétique", icon: "fas fa-eye" },
  animalerie = { name: "Animalerie", icon: "fas fa-dog" },
  opticien = { name: "Opticien", icon: "fas fa-glasses" },
  jardinerie = { name: "Jardinerie", icon: "fas fa-tree" },
  librairie = { name: "Librairie", icon: "fas fa-book" },
  artisanat = { name: "Artisanat", icon: "fas fa-chair" },
  funeraire = { name: "Funéraire", icon: "fas fa-cross" }
  ]
categories.each do |category|
  Category.create(name: category[:name], icon: category[:icon])
end
p Category.all
puts "✨✨ Categories created !! ✨✨"

# create 5 users with 1 shop, 1 event by shop

5.times do

  # Gathering RANDOMUSER API to create users and shops
  # Opening and parsing JSON.
  data_url = "https://randomuser.me/api/?nat=fr"
  random_user_json = open(data_url).read
  random_user = JSON.parse(random_user_json)

  puts "🙋 Creating user..."
  first_name = random_user["results"][0]["name"]["first"]
  last_name = random_user["results"][0]["name"]["last"]

  email = "#{first_name.downcase}.#{last_name.downcase}@hoplette.com"
  password = "hoplette"
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  )
  if user.valid?
    user.save!
    puts "User #{user.first_name} #{user.last_name} created ! 🙌"
  else
    puts "User not created due to duplicate data 😢"
  end


  #creating shop
  if user.valid?
    puts "🙋 Creating shop for this user..."
    active = true
    name = Faker::TvShows::Simpsons.location

    # Gathering elements of the address and create the full address
    address = ["9 rue bouquière, bordeaux", "22 quai duguay trouin, rennes", "9 rue du chemin vert, paris", "6 rue pizay, lyon", "4 rue des cigognes, strasbourg", "10 rue du guesclin, marseille"].sample
    # street_nb = (2..12).to_a.sample
    # street = random_user["results"][0]["location"]["street"]["name"]
    # # cp = random_user["results"][0]["location"]["postcode"]
    # city = random_user["results"][0]["location"]["city"]
    # address = "#{street_nb} #{street}, #{city}"

    # Finish shop creation

    description = Faker::ChuckNorris.fact

    shop = Shop.new(
      active: active,
      name: name,
      address: address,
      description: description
    )
    shop.user_id = user.id
    shop.save!

    if shop.valid?
      shop.save!
      puts  "Shop #{shop.name} saved 🙌"
    else
      puts "Shop not created due to duplicate data 😢"
    end

    # Add category (tags) to the shop (created a class method random in category)

    puts "🏠 Creating 1, 2 or 3 categories (tags) for this shop..."

    i = (1..3).to_a.sample

    i.times do
      category = Category.random
      tag = Tag.new
      tag.category_id = category.id
      tag.shop_id = shop.id
      tag.save!
    end

    puts "#{i} tag(s) added ⛄"

    # Add events to the shop

    puts "📅 Creating 1, 2 or 3 events for this shop... "

    i = (1..3).to_a.sample

    i.times do
      title = ["10% de réduction sur tout !", "Vernissage exceptionnel 🎇", "Un thé offert pour toute visite 🍵", "Nouvelle collection dans les rayons", "Réductions jusqu'à 30% pour fin de collection!"].sample
      description = ["On vous attend nombreux!", "N'oubliez pas votre tot-bag pour limiter les sacs jetables 😉 "].sample
      beg_date = Faker::Date.between(from: 2.days.ago, to: Date.today)
      end_date = Faker::Date.between(from: Date.today, to: 20.days.from_now)
      category = ["Evènement", "Promotion"].sample
      offer = ["10%", "2 achetés 1 offert", "Un thé offert"].sample
      active = [true, false].sample
      buyers = (50..100).to_a.sample
      event = Event.new(
        title: title,
        description: description,
        offer: offer,
        beg_date: beg_date,
        end_date: end_date,
        category: category,
        active: active,
        buyers: buyers,
        qr_code: nil
      )
      event.shop_id = shop.id
      event.save!
      qr_code = "www.hop-hop-hop.com/events/#{event.id}"
      event.qr_code = qr_code
      event.save!
    end

    puts "#{i} event(s) added 📆"
  end
end

# Create users without shops

5.times do
  puts "🙋 Creating user without shop..."

  # Gathering RANDOMUSER API to create users and shops
  # Opening and parsing JSON.
  data_url = "https://randomuser.me/api/?nat=fr"
  random_user_json = open(data_url).read
  random_user = JSON.parse(random_user_json)

  first_name = random_user["results"][0]["name"]["first"]
  last_name = "No_shop"
  email = "#{first_name.downcase}.#{last_name.downcase}@hoplette.com"
  password = "hoplette"
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  )

  if user.valid?
    user.save!
    puts "User #{user.first_name} #{user.last_name} created ! 🙌"
  else
    puts "User not created due to duplicate data 😢"
  end
end

# Create random favories on random users

puts "Putting 20 events as favorites for random users..."

20.times do
  user = User.random
  event = Event.random
  favorite_event = FavoriteEvent.new
  favorite_event.user_id = user.id
  favorite_event.event_id = event.id
  favorite_event.save!
end

puts "Finishing creation of 20 events as favorites 🎆"


# Creating user who has every shops
puts "⏲ Creating Admin... ⏲"

first_name ="User"
last_name ="Boss"

email = "admin@hoplette.com"
password = "hoplette"
user1 = User.new(
  first_name: first_name,
  last_name: last_name,
  email: email,
  password: password
)
user1.save!

puts "✨✨ Admin created !! ✨✨"


puts "Creating real shops"

file = 'db/shops.json'

accepted_categories = [ "Pharmacie", "Fournitures", "Restauration", 
"Occasions", "Cuisine", "Discount", "Animalerie", "Loisirs", "Opticiens", 
"Confiserie", "Boisson", "Jardinerie", "Garagiste", "Fleuriste", "Salles", 
"Livres", "Boulangerie", "Esthétique", 
"Coiffeurs", "Peintre", "Culture", "Presse", "Menuiserie", 
"Événementiel", "Pompes", "cavistes"]

mapping_categories = {
  "Pharmacie" => Category.find_by(name: "Santé").id,
  "Fournitures" => Category.find_by(name: "Quincaillerie").id, 
  "Restauration" => Category.find_by(name: "Alimentation").id, 
  "Occasions" => Category.find_by(name: "Quincaillerie").id, 
  "Cuisine" => Category.find_by(name: "Alimentation").id, 
  "Discount" => Category.find_by(name: "Quincaillerie").id, 
  "Animalerie" => Category.find_by(name: "Animalerie").id, 
  "Loisirs" => Category.find_by(name: "Divertissement").id, 
  "Opticiens" => Category.find_by(name: "Opticien").id, 
  "Confiserie" => Category.find_by(name: "Alimentation").id, 
  "Boisson" => Category.find_by(name: "Alimentation").id, 
  "Jardinerie" => Category.find_by(name: "Jardinerie").id, 
  "Garagiste" => Category.find_by(name: "Garage").id, 
  "Fleuriste" => Category.find_by(name: "Fleuriste").id, 
  "fleuristes" => Category.find_by(name: "Fleuriste").id, 
  "Salles" => Category.find_by(name: "Divertissement").id, 
  "Livres" => Category.find_by(name: "Librairie").id, 
  "Boulangerie" => Category.find_by(name: "Alimentation").id, 
  "Esthétique" => Category.find_by(name: "Esthétique").id, 
  "Coiffeurs" => Category.find_by(name: "Esthétique").id, 
  "Peintre" => Category.find_by(name: "Artisanat").id, 
  "Culture" => Category.find_by(name: "Esthétique").id, 
  "Presse" => Category.find_by(name: "Librairie").id, 
  "Menuiserie" => Category.find_by(name: "Artisanat").id, 
  "Événementiel" => Category.find_by(name: "Divertissement").id, 
  "Pompes" => Category.find_by(name: "Funéraire").id,
  "cavistes" => Category.find_by(name: "Caviste").id
}

shops = JSON.parse(File.read(file))
shops["shops"].each do |shop|
  if accepted_categories.include?(shop["category"])
    new_shop = Shop.new(
      active: true,
      name:  shop["name"],
      address: shop["address"],
      description: shop["description"]
    )
    puts "#{new_shop[:name]} created based on #{new_shop[:address]}"
    new_shop.user_id = user1.id
    new_shop.save! if new_shop.valid?

    tag = Tag.new
      p mapping_categories[shop["category"]]
      tag.category_id = mapping_categories[shop["category"]]
      tag.shop_id = new_shop.id
      tag.save!
  end
end
  puts "Ending creating real shops"
