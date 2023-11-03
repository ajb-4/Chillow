# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    Home.destroy_all
    Search.destroy_all
    User.destroy_all
   
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('homes')
    ApplicationRecord.connection.reset_pk_sequence!('searches')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    
end

User.create!(
    username: 'DemoUser',
    email: 'demo@gmail.com',
    password: 'Password$1'
)

User.create!(
  username: 'DemoAlex', 
  email: 'demo@user.io', 
  password: 'Alex$Password7'
)

User.create!(
  username: 'DemoAlex2', 
  email: 'demo2@user.io', 
  password: 'Alex$Password7'
)

Home.create!(
  address: '35 Bayberry Lane',
  city: 'Hanover',
  state: 'MA',
  zipcode: '02337',  
  price: 777777, 
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 3456,
  lot_size: 0.78,
  built_date: 1997,
  property_type: 'single-family',
  seller_id: 1,
  description: "Gray house on the corner."
)

Home.create!(
  address: '50 Blueberry Lane',
  city: 'Portsmouth',
  state: 'NH',
  zipcode: '02909',  
  price: 47900, 
  bedrooms: 1,
  bathrooms: 1,
  square_feet: 296,
  lot_size: 0.28,
  built_date: 1937,
  property_type: 'single-family',
  seller_id: 2,
  description: "Gray house on the corner."
)


Home.create!(
  address: '44 Tall Tree Road',
  city: 'Thirdsville',
  state: 'MI',
  zipcode: '62535',  
  price: 425000, 
  bedrooms: 6,
  bathrooms: 4,
  square_feet: 2968,
  lot_size: 3.28,
  built_date: 1937,
  property_type: 'single-family',
  seller_id: 1,
  description: "Gray house on the corner."
)

Home.create!(
  address: '50 App Academy Lane',
  city: 'Coding',
  state: 'NY',
  zipcode: '62535',  
  price: 425000, 
  bedrooms: 6,
  bathrooms: 4,
  square_feet: 2968,
  lot_size: 3.28,
  built_date: 1937,
  property_type: 'Duplex',
  seller_id: 1,
  description: "Gray house on the corner."
)

Home.create!(
  address: '5555 MainStreet',
  city: 'New York City',
  state: 'NY',
  zipcode: '00535',  
  price: 4250000, 
  bedrooms: 6,
  bathrooms: 2,
  square_feet: 2968,
  lot_size: 0.28,
  built_date: 1837,
  property_type: 'condominium',
  seller_id: 2,
  description: "Near coffee shop."
)

Home.create!(
  address: '33 Cedar Creek',
  city: 'Albright',
  state: 'WI',
  zipcode: '62885',  
  price: 425000, 
  bedrooms: 6,
  bathrooms: 4,
  square_feet: 2968,
  lot_size: 3.68,
  built_date: 1937,
  property_type: 'single-family',
  seller_id: 1,
  description: "Gray house on the corner."
)


Home.create!(
  address: '1289 React Redux',
  city: 'Lincoln',
  state: 'ME',
  zipcode: '62535',  
  price: 425000, 
  bedrooms: 6,
  bathrooms: 4,
  square_feet: 2968,
  lot_size: 3.28,
  built_date: 1937,
  property_type: 'Duplex',
  seller_id: 1,
  description: "Gray house on the corner."
)

Home.create!(
  address: '55 Lucky Road',
  city: 'LastDemo',
  state: 'CA',
  zipcode: '77535',  
  price: 4655000, 
  bedrooms: 6,
  bathrooms: 7,
  square_feet: 2968,
  lot_size: 3.28,
  built_date: 1937,
  property_type: 'Condominium',
  seller_id: 1,
  description: "Gray house on the corner."
)

10.times do
  Search.create!({
    price_min: Faker::Number.between(from: 100000, to: 2000000),
    price_max: Faker::Number.between(from: 500000, to: 10000000),
    beds: Faker::Number.between(from: 1, to: 5),
    baths: Faker::Number.between(from: 1, to: 5),
    home_type: 'Condominium',
    searcher: User.first 
  })
end

i = 0
arr_homes = Home.first(8)

  while i <= 7 do
  arr_homes[i].photos.attach(

    io: URI.open("https://chillow-seeds.s3.amazonaws.com/Chillowimage#{i + 1}.jpeg"), 
    filename: "Chillowimage#{i + 1}.jpeg"
  )
  # arr_homes[i].photos.attach(

  #   io: URI.open("https://chillow-seeds.s3.amazonaws.com/Chillowimage#{i + 9}.jpeg"), 
  #   filename: "Chillowimage#{i + 9}.jpeg"
  # )
  # arr_homes[i].photos.attach(
  
  #   io: URI.open("https://chillow-seeds.s3.amazonaws.com/Chillowimage#{i + 17}.jpeg"), 
  #   filename: "Chillowimage#{i + 17}.jpeg"
  # )

  i += 1

  end
  

  puts "Done!"