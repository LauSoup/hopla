# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Delete every data'
User.destroy_all
Shop.destroy_all

puts 'Creating data'

User.create(
  first_name: 'bob',
  last_name: 'marley',
  email: 'bob@marley.com',
  password: 'password')

Shop.create(
  address: '85 rue de la croix nivert, paris',
  description: 'coucou les amis',
  name: 'chez gerald',
  user_id: 1)

puts 'Created'
