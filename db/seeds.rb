require 'open-uri'
require 'faker'

puts "Destroying tables..."
Home.destroy_all
Search.destroy_all
User.destroy_all

puts "Resetting primary keys..."
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('homes')
ApplicationRecord.connection.reset_pk_sequence!('searches')

puts "Creating users..."
User.create!(username: 'DemoUser', email: 'demo@gmail.com', password: 'Password$1')
User.create!(username: 'DemoAlex', email: 'demo@user.io', password: 'Alex$Password7')
User.create!(username: 'DemoAlex2', email: 'demo2@user.io', password: 'Alex$Password7')

puts "Creating homes..."

60.times do
  address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zipcode = Faker::Address.zip_code
  coordinates = Faker::Address.latitude.to_f.round(6), Faker::Address.longitude.to_f.round(6)

  price = (Faker::Number.between(from: 8, to: 300) * 25000).round(-4)
  bedrooms = Faker::Number.between(from: 1, to: 7)
  bathrooms = (Faker::Number.between(from: 2, to: 10) / 2.0).round(1)
  square_feet = Faker::Number.between(from: 500, to: 7000)
  lot_size = Faker::Number.decimal(l_digits: 2, r_digits: 2)
  built_date = Faker::Number.between(from: 1990, to: 2023)
  property_type = %w[Single-Family Cabin Dwelling].sample
  description = Faker::Lorem.sentence(word_count: 100)
  seller_id = 1

  Home.create!(
    address: address,
    city: city,
    state: state,
    zipcode: zipcode,
    price: price,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    square_feet: square_feet,
    lot_size: lot_size,
    built_date: built_date,
    property_type: property_type,
    seller_id: seller_id,
    description: description,
    latitude: coordinates[0],
    longitude: coordinates[1]
  )
end
# Home.create!(
#   address: '35 Bayberry Lane',
#   city: 'Hanover',
#   state: 'MA',
#   zipcode: '02337',
#   price: 777777,
#   bedrooms: 3,
#   bathrooms: 2.5,
#   square_feet: 3456,
#   lot_size: 0.78,
#   built_date: 1997,
#   property_type: 'single-family',
#   seller_id: 1,
#   description: 'Gray house on the corner.',
#   latitude: 47.6062,
#   longitude: -122.3321
# )

# Home.create!(
#   address: '50 Blueberry Lane',
#   city: 'Portsmouth',
#   state: 'NH',
#   zipcode: '02909',  
#   price: 47900, 
#   bedrooms: 1,
#   bathrooms: 1,
#   square_feet: 296,
#   lot_size: 0.28,
#   built_date: 1937,
#   property_type: 'single-family',
#   seller_id: 2,
#   description: "Gray house on the corner.",
#   latitude: 37.7749,
#   longitude: -122.4194
# )


# Home.create!(
#   address: '44 Tall Tree Road',
#   city: 'Thirdsville',
#   state: 'MI',
#   zipcode: '62535',  
#   price: 425000, 
#   bedrooms: 6,
#   bathrooms: 4,
#   square_feet: 2968,
#   lot_size: 3.28,
#   built_date: 1937,
#   property_type: 'single-family',
#   seller_id: 1,
#   description: "Gray house on the corner.",
#   latitude: 39.7392,
#   longitude: -104.9903
# )

# Home.create!(
#   address: '50 App Academy Lane',
#   city: 'Coding',
#   state: 'NY',
#   zipcode: '62535',  
#   price: 425000, 
#   bedrooms: 6,
#   bathrooms: 4,
#   square_feet: 2968,
#   lot_size: 3.28,
#   built_date: 1937,
#   property_type: 'Duplex',
#   seller_id: 1,
#   description: "Gray house on the corner.",
#   latitude: 30.2500,
#   longitude: -97.7500
# )

# Home.create!(
#   address: '5555 MainStreet',
#   city: 'New York City',
#   state: 'NY',
#   zipcode: '00535',  
#   price: 4250000, 
#   bedrooms: 6,
#   bathrooms: 2,
#   square_feet: 2968,
#   lot_size: 0.28,
#   built_date: 1837,
#   property_type: 'condominium',
#   seller_id: 2,
#   description: "Near coffee shop.",
#   latitude: 41.8781,
#   longitude: -87.6298
# )

# Home.create!(
#   address: '33 Cedar Creek',
#   city: 'Albright',
#   state: 'WI',
#   zipcode: '62885',  
#   price: 425000, 
#   bedrooms: 6,
#   bathrooms: 4,
#   square_feet: 2968,
#   lot_size: 3.68,
#   built_date: 1937,
#   property_type: 'single-family',
#   seller_id: 1,
#   description: "Gray house on the corner.",
#   latitude: 40.7128,
#   longitude: -74.0060
# )


# Home.create!(
#   address: '1289 React Redux',
#   city: 'Lincoln',
#   state: 'ME',
#   zipcode: '62535',  
#   price: 425000, 
#   bedrooms: 6,
#   bathrooms: 4,
#   square_feet: 2968,
#   lot_size: 3.28,
#   built_date: 1937,
#   property_type: 'Duplex',
#   seller_id: 1,
#   description: "Gray house on the corner.",
#   latitude: 25.7617,
#   longitude: -80.1918
# )

# Home.create!(
#   address: '55 Lucky Road',
#   city: 'LastDemo',
#   state: 'CA',
#   zipcode: '77535',  
#   price: 4655000, 
#   bedrooms: 6,
#   bathrooms: 7,
#   square_feet: 2968,
#   lot_size: 3.28,
#   built_date: 1937,
#   property_type: 'Condominium',
#   seller_id: 1,
#   description: "Gray house on the corner.",
#   latitude: 45.5051,
#   longitude: -122.6750
# )

puts "Creating searches..."
10.times do
  Search.create!(
    price_min: Faker::Number.between(from: 100000, to: 2000000),
    price_max: Faker::Number.between(from: 500000, to: 10000000),
    beds: Faker::Number.between(from: 1, to: 5),
    baths: Faker::Number.between(from: 1, to: 5),
    home_type: 'Condominium',
    searcher: User.first
  )
end

puts "Attaching photos to homes..."
arr_homes = Home.all

arr_homes.each_with_index do |home, i|

  home.photos.attach(
    io: URI.open("https://chillow-seeds.s3.amazonaws.com/Chillowimage#{i + 1}.jpeg"),
    filename: "Chillowimage#{i + 1}.jpeg"
  )

  additional_photos = (101..110).to_a.shuffle.map { |num| "https://chillow-seeds.s3.amazonaws.com/Chillowimage#{num}.jpeg" }

  additional_photos.each do |photo_url|
    home.photos.attach(
      io: URI.open(photo_url),
      filename: File.basename(photo_url)
    )
  end

end

puts "Done!"