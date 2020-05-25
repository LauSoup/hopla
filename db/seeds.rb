# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'
require 'open-uri'


# Destroy current data before creating new ones

puts "💣Erasing all current data...💣"
User.destroy_all
Shop.destroy_all
Event.destroy_all
Category.destroy_all
FavoriteEvent.destroy_all
Tag.destroy_all

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


categories = ["Loisirs & Divertissement", "Multimédia & Electronique", "Santé & Pharmacie", "Vêtements", "Jeux", "Fleuriste", "Garage", "Caviste", "Maroquinerie", "Quincaillerie"]
categories.each do |category|
  Category.create(name: category)
end
p Category.all
puts "✨✨ Categories created !! ✨✨"

# create 5 users with 1 shop, 1 event by shop

5.times do
  puts "Creating user 🙋"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  
  email = "#{first_name}.#{last_name}@hoplette.com"
  password = "hoplette"
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  )
  user.save!
  p user
  puts "User #{user.first_name}  #{user.last_name} created ! 🙌"

  #creating shop
  puts "Creating shop for this user 🙋"
  active = true
  name = Faker::TvShows::Simpsons.location

  # Creating addresses of shops with RANDOMUSER API.
  # Opening and parsing JSON.
  data_url = "https://randomuser.me/api/?nat=fr"
  random_user_json = open(data_url).read
  random_user = JSON.parse(random_user_json)

  # Gathering elements of the address and create the full address

  street_nb = random_user["results"][0]["location"]["street"]["number"]
  street = random_user["results"][0]["location"]["street"]["name"]
  # cp = random_user["results"][0]["location"]["postcode"]
  city = random_user["results"][0]["location"]["city"]
  address = "#{street_nb} #{street}, #{city}"

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

  puts "Shop #{shop.name} saved 🙌"

  # Add category (tags) to the shop (created a class method random in category)

  puts "Creating 1, 2 or 3 categories (tags) for this shop 🏠"
  
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

  puts "Creating 1, 2 or 3 events for this shop 📅"
  
  i = (1..3).to_a.sample

  i.times do
    title = ["10% de réduction sur tout !", "Vernissage exceptionnel 🎇", "Un thé offert pour toute visite 🍵", "Nouvelle collection dans les rayons", "Réductions jusqu'à 30% pour fin de collection!"].sample
    description = ["On vous attend nombreux!", "N'oubliez pas votre tot-bag pour limiter les sacs jetables 😉 "].sample
    beg_date = Faker::Date.between(from: 2.days.ago, to: Date.today)
    end_date = Faker::Date.between(from: Date.today, to: 20.days.from_now)
    category = ["Evènement", "Promotion"].sample  
    active = [true, false].sample
    event = Event.new(
      title: title,
      description: description,
      beg_date: beg_date,
      end_date: end_date,
      category: category,
      active: active
    )
    event.shop_id = shop.id
    event.save!
  end

  puts "#{i} event(s) added 📆"

  # Create users without shops

  5.times do
    puts "Creating user without shop 🙋"
    first_name = Faker::Name.first_name
    last_name = "No_shop"
    
    email = "#{first_name}.#{last_name}@hoplette.com"
    password = "hoplette"
    user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    )
    user.save!
    p user
    puts "User #{user.first_name} #{user.last_name} created ! 🙌"
  end

 # Create random favories on random users

  puts "Putting 20 events as favorites for random users"

  20.times do
    user = User.random
    event = Event.random
    favorite_event = FavoriteEvent.new
    favorite_event.user_id = user.id
    favorite_event.event_id = event.id
    favorite_event.save!
  end

  puts "Finishing creation of 20 events as favorites 🎆"

end
# User
# Category 
# Shop
# Event
# Favories
