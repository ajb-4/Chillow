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

Home.create!(
  address: '123 Pine Street',
  city: 'Burlington',
  state: 'VT',
  zipcode: '05401',
  price: 325000,
  bedrooms: 2,
  bathrooms: 1.5,
  square_feet: 1800,
  lot_size: 0.4,
  built_date: 2005,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Nestled in the charming city of Burlington, Vermont, this delightful home at 123 Pine Street offers more than just comfort; it provides a unique lifestyle. With two bedrooms and one and a half baths, this cozy abode boasts a perfect blend of functionality and elegance. Imagine waking up to the serene view of the Green Mountains, surrounded by the beauty of nature. The propertys 1800 square feet provide ample space for relaxation and entertainment. Built in 2005, this home combines modern amenities with classic charm. Come and experience the warmth and character of this Vermont gem.',
  latitude: 44.4759,
  longitude: -73.2112
)

Home.create!(
  address: '456 Mountain Road',
  city: 'Boulder',
  state: 'CO',
  zipcode: '80302',
  price: 800000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 3000,
  lot_size: 1.2,
  built_date: 1998,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the Rockies with this picturesque cabin on 456 Mountain Road in Boulder, Colorado. Offering four bedrooms and three baths, this charming retreat is an outdoor enthusiasts dream. Surrounded by the majestic mountains, the property spans 1.2 acres, providing ample space for privacy and relaxation. Built in 1998, the cabin features rustic charm combined with modern conveniences. The 3000 square feet of living space allows for comfortable living and entertaining. Immerse yourself in the tranquility of nature while enjoying the beauty of this unique Colorado setting.',
  latitude: 40.0150,
  longitude: -105.2705
)

Home.create!(
  address: '79 Meadow Lane',
  city: 'Bozeman',
  state: 'MT',
  zipcode: '59715',
  price: 450000,
  bedrooms: 3,
  bathrooms: 2,
  square_feet: 2400,
  lot_size: 0.8,
  built_date: 2012,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Discover modern living surrounded by Montanas natural beauty in this stunning dwelling on 79 Meadow Lane in Bozeman. With three bedrooms and two baths, this home offers contemporary design and spacious living. Built in 2012, the property is a harmonious blend of style and tranquility. Enjoy panoramic views of the mountains from the 0.8-acre lot, providing a peaceful retreat. The 2400 square feet of living space allows for comfortable and stylish living. Embrace the essence of Bozeman with this unique dwelling, where modern luxury meets the rugged allure of Montanas breathtaking landscapes.',
  latitude: 45.6770,
  longitude: -111.0429
)

Home.create!(
  address: '234 Maple Avenue',
  city: 'Portland',
  state: 'ME',
  zipcode: '04101',
  price: 500000,
  bedrooms: 3,
  bathrooms: 2,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2015,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Embrace coastal living in this charming home at 234 Maple Avenue, Portland, Maine. With three bedrooms and two baths, this single-family residence offers a perfect blend of comfort and coastal allure. The property, built in 2015, features modern amenities within a classic New England setting. Imagine sipping your morning coffee on the porch, feeling the ocean breeze. The 2200 square feet of living space provides a spacious and inviting atmosphere. Enjoy the convenience of city life combined with the tranquility of coastal living in this picturesque Maine home.',
  latitude: 43.6591,
  longitude: -70.2568
)

Home.create!(
  address: '567 Pinehurst Drive',
  city: 'Traverse City',
  state: 'MI',
  zipcode: '49684',
  price: 700000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2800,
  lot_size: 1.0,
  built_date: 2008,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the serene beauty of Northern Michigan with this cabin at 567 Pinehurst Drive, Traverse City. Offering four bedrooms and three and a half baths, this cabin is a perfect retreat for all seasons. Nestled on a 1-acre lot and built in 2008, the property combines rustic charm with modern comfort. Imagine cozying up by the fireplace in the winter or enjoying the spacious deck in the summer. The 2800 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Northern Michigan in this inviting and idyllic cabin.',
  latitude: 44.7631,
  longitude: -85.6206
)

Home.create!(
  address: '890 Evergreen Lane',
  city: 'Bend',
  state: 'OR',
  zipcode: '97701',
  price: 600000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2400,
  lot_size: 0.9,
  built_date: 2010,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Discover the beauty of Central Oregon in this modern dwelling at 890 Evergreen Lane, Bend. With three bedrooms and two and a half baths, this home offers contemporary design surrounded by the stunning landscapes of Bend. Built in 2010, the property features sleek architecture and spacious living. The 2400 square feet of living space provides comfort and style. Enjoy the expansive 0.9-acre lot, creating a private and peaceful oasis. Whether youre an outdoor enthusiast or seeking a modern lifestyle, this dwelling in Bend offers the perfect blend of luxury and natural beauty.',
  latitude: 44.0521,
  longitude: -121.3153
)

Home.create!(
  address: '345 Summit Drive',
  city: 'Boise',
  state: 'ID',
  zipcode: '83702',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2000,
  lot_size: 0.5,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Experience the charm of Boise, Idaho, in this elegant home at 345 Summit Drive. With three bedrooms and two and a half baths, this single-family residence offers a perfect combination of comfort and sophistication. Built in 2013, the property showcases modern amenities within the scenic backdrop of Boise. Imagine entertaining guests in the spacious living area or enjoying the private backyard oasis. The 2000 square feet of living space provides an inviting atmosphere for both relaxation and social gatherings. Make Boise your home and enjoy the vibrant culture and outdoor adventures.',
  latitude: 43.6150,
  longitude: -116.2023
)

Home.create!(
  address: '678 Mountain View Avenue',
  city: 'Fargo',
  state: 'ND',
  zipcode: '58102',
  price: 450000,
  bedrooms: 3,
  bathrooms: 2,
  square_feet: 1800,
  lot_size: 0.4,
  built_date: 2006,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the peaceful beauty of Fargo, North Dakota, with this charming cabin at 678 Mountain View Avenue. Offering three bedrooms and two baths, this cabin is a retreat from the hustle and bustle of city life. Nestled on a 0.4-acre lot and built in 2006, the property combines rustic charm with modern conveniences. Imagine enjoying evenings by the fireplace or relaxing on the porch with views of the surrounding nature. The 1800 square feet of living space provides comfort and warmth. Discover the tranquility of Fargo in this cozy and welcoming cabin.',
  latitude: 46.8772,
  longitude: -96.7898
)

Home.create!(
  address: '901 Redwood Lane',
  city: 'Aspen',
  state: 'CO',
  zipcode: '81611',
  price: 1200000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 4000,
  lot_size: 1.5,
  built_date: 2002,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Indulge in the luxury of Aspen, Colorado, with this exquisite dwelling at 901 Redwood Lane. Boasting five bedrooms and four and a half baths, this home offers sophistication and comfort in the heart of the Rockies. Built in 2002, the property features elegant design and panoramic mountain views. Imagine entertaining in the spacious living areas or relaxing in the private outdoor spaces. The 4000 square feet of living space provides ample room for both intimate gatherings and larger events. Experience the opulence of Aspen living in this stunning and meticulously crafted dwelling.',
  latitude: 39.1911,
  longitude: -106.8175
)

Home.create!(
  address: '123 Evergreen Lane',
  city: 'Spokane',
  state: 'WA',
  zipcode: '99201',
  price: 650000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2600,
  lot_size: 0.7,
  built_date: 2014,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the beauty of Spokane, Washington, in this elegant single-family home at 123 Evergreen Lane. With four bedrooms and three and a half baths, this residence offers a perfect blend of modern luxury and natural surroundings. Built in 2014, the property features stylish design and spacious living areas. Imagine enjoying the stunning views from the private backyard or entertaining guests in the open-concept living space. The 2600 square feet of living space provides both comfort and sophistication. Make Spokane your home and experience the vibrant culture and outdoor adventures.',
  latitude: 47.6588,
  longitude: -117.4260
)

Home.create!(
  address: '456 Oakwood Court',
  city: 'Helena',
  state: 'MT',
  zipcode: '59601',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2010,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the serene beauty of Helena, Montana, with this charming cabin at 456 Oakwood Court. Offering three bedrooms and two baths, this cabin is a perfect retreat for all seasons. Nestled on a 0.6-acre lot and built in 2010, the property combines rustic charm with modern comfort. Imagine cozying up by the fireplace in the winter or enjoying the spacious deck in the summer. The 2200 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Helena in this inviting and idyllic cabin.',
  latitude: 46.5898,
  longitude: -112.0391
)

Home.create!(
  address: '789 Cedar Lane',
  city: 'Eugene',
  state: 'OR',
  zipcode: '97401',
  price: 700000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2800,
  lot_size: 1.0,
  built_date: 2008,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Discover the beauty of Eugene, Oregon, in this modern dwelling at 789 Cedar Lane. With four bedrooms and three and a half baths, this home offers contemporary design surrounded by the stunning landscapes of Eugene. Built in 2008, the property features sleek architecture and spacious living. The 2800 square feet of living space provides comfort and style. Enjoy the expansive 1.0-acre lot, creating a private and peaceful oasis. Whether youre an outdoor enthusiast or seeking a modern lifestyle, this dwelling in Eugene offers the perfect blend of luxury and natural beauty.',
  latitude: 44.0521,
  longitude: -123.0868
)

Home.create!(
  address: '234 Redwood Lane',
  city: 'Anchorage',
  state: 'AK',
  zipcode: '99501',
  price: 750000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2300,
  lot_size: 0.8,
  built_date: 2016,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Experience the unique beauty of Anchorage, Alaska, in this contemporary single-family home at 234 Redwood Lane. Offering three bedrooms and two and a half baths, this residence provides modern luxury within a stunning natural setting. Built in 2016, the property features sleek design and spacious living areas. Imagine enjoying the Northern Lights from your own backyard or exploring the nearby wilderness. The 2300 square feet of living space offers both comfort and style. Make Anchorage your home and embrace the unparalleled landscapes and outdoor adventures.',
  latitude: 61.0160,
  longitude: -149.7375
)

Home.create!(
  address: '567 Cedarwood Avenue',
  city: 'Bozeman',
  state: 'MT',
  zipcode: '59718',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2600,
  lot_size: 1.0,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the picturesque beauty of Bozeman, Montana, with this charming cabin at 567 Cedarwood Avenue. Offering four bedrooms and three baths, this cabin is a haven for all seasons. Nestled on a 1.0-acre lot and built in 2012, the property combines rustic charm with modern conveniences. Imagine cozying up by the fireplace in the winter or enjoying the expansive deck in the summer. The 2600 square feet of living space provides ample room for relaxation and entertaining. Experience the enchantment of Bozeman in this welcoming and idyllic cabin.',
  latitude: 45.6676,
  longitude: -111.0489
)

Home.create!(
  address: '890 Juniper Lane',
  city: 'Aspen',
  state: 'CO',
  zipcode: '81612',
  price: 1400000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 4200,
  lot_size: 1.2,
  built_date: 2003,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Indulge in the luxurious lifestyle of Aspen, Colorado, with this exquisite dwelling at 890 Juniper Lane. Boasting five bedrooms and four and a half baths, this home offers sophistication and comfort in the heart of the Rockies. Built in 2003, the property features elegant design and breathtaking mountain views. Imagine entertaining in the spacious living areas or relaxing in the private outdoor spaces. The 4200 square feet of living space provides ample room for both intimate gatherings and larger events. Experience the opulence of Aspen living in this stunning and meticulously crafted dwelling.',
  latitude: 39.1840,
  longitude: -106.8210
)

Home.create!(
  address: '123 Birch Street',
  city: 'Whitefish',
  state: 'MT',
  zipcode: '59937',
  price: 680000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2015,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Experience the charm of Whitefish, Montana, in this elegant single-family home at 123 Birch Street. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and natural surroundings. Built in 2015, the property features stylish design and spacious living areas. Imagine enjoying the breathtaking views of Whitefish Lake from your own backyard or exploring the nearby trails. The 2400 square feet of living space provides both comfort and style. Make Whitefish your home and embrace the outdoor adventures and small-town charm.',
  latitude: 48.4111,
  longitude: -114.3376
)

Home.create!(
  address: '456 Pinecrest Lane',
  city: 'Bend',
  state: 'OR',
  zipcode: '97703',
  price: 620000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2600,
  lot_size: 0.8,
  built_date: 2013,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the serene beauty of Bend, Oregon, with this charming cabin at 456 Pinecrest Lane. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2013, the property combines rustic charm with modern comfort. Imagine enjoying the mountain views from the cozy living room or relaxing on the spacious deck. The 2600 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Bend in this inviting and idyllic cabin.',
  latitude: 44.0719,
  longitude: -121.3153
)

Home.create!(
  address: '789 Elmwood Avenue',
  city: 'Lake Placid',
  state: 'NY',
  zipcode: '12946',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2005,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Discover the enchanting beauty of Lake Placid, New York, in this modern dwelling at 789 Elmwood Avenue. With five bedrooms and four and a half baths, this home offers contemporary design surrounded by the stunning landscapes of the Adirondacks. Built in 2005, the property features sleek architecture and spacious living. Imagine enjoying the private backyard with views of Mirror Lake or exploring the nearby Olympic Village. The 3500 square feet of living space provides comfort and style. Whether youre a nature lover or seeking a tranquil lifestyle, this dwelling in Lake Placid offers the perfect blend of luxury and natural beauty.',
  latitude: 44.2795,
  longitude: -73.9798
)

Home.create!(
  address: '234 Spruce Lane',
  city: 'Missoula',
  state: 'MT',
  zipcode: '59801',
  price: 700000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2800,
  lot_size: 0.9,
  built_date: 2010,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Experience the vibrant city of Missoula, Montana, in this elegant single-family home at 234 Spruce Lane. With four bedrooms and three and a half baths, this residence offers a perfect blend of modern luxury and urban living. Built in 2010, the property features stylish design and spacious living areas. Imagine walking to downtown Missoula for coffee or enjoying the nearby hiking trails. The 2800 square feet of living space provides both comfort and style. Make Missoula your home and enjoy the cultural amenities and outdoor activities.',
  latitude: 46.8721,
  longitude: -113.9940
)

Home.create!(
  address: '567 Maplewood Drive',
  city: 'Eugene',
  state: 'OR',
  zipcode: '97405',
  price: 600000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2400,
  lot_size: 0.8,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the serene beauty of Eugene, Oregon, with this charming cabin at 567 Maplewood Drive. Offering three bedrooms and two and a half baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the peaceful surroundings from the cozy living room or relaxing on the spacious deck. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Eugene in this inviting and idyllic cabin.',
  latitude: 44.0106,
  longitude: -123.0918
)

Home.create!(
  address: '890 Birchwood Lane',
  city: 'Aspen',
  state: 'CO',
  zipcode: '81611',
  price: 1200000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 4000,
  lot_size: 1.5,
  built_date: 2007,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Indulge in the luxury of Aspen, Colorado, with this exquisite dwelling at 890 Birchwood Lane. Boasting five bedrooms and four and a half baths, this home offers sophistication and comfort in the heart of the Rockies. Built in 2007, the property features elegant design and breathtaking mountain views. Imagine entertaining in the spacious living areas or relaxing in the private outdoor spaces. The 4000 square feet of living space provides ample room for both intimate gatherings and larger events. Experience the opulence of Aspen living in this stunning and meticulously crafted dwelling.',
  latitude: 39.1840,
  longitude: -106.8175
)

Home.create!(
  address: '123 Pinehurst Lane',
  city: 'Traverse City',
  state: 'MI',
  zipcode: '49684',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the beauty of Traverse City, Michigan, in this elegant single-family home at 123 Pinehurst Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and natural surroundings. Built in 2013, the property features stylish design and spacious living areas. Imagine enjoying the serene views of Grand Traverse Bay from your own backyard or exploring the nearby wineries. The 2200 square feet of living space provides both comfort and style. Make Traverse City your home and embrace the charm of Northern Michigan.',
  latitude: 44.7631,
  longitude: -85.6206
)

Home.create!(
  address: '456 Forest Drive',
  city: 'Bend',
  state: 'OR',
  zipcode: '97701',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the picturesque beauty of Bend, Oregon, with this charming cabin at 456 Forest Drive. Offering four bedrooms and three baths, this cabin is a haven for all seasons. Nestled on a 0.7-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the mountain views from the cozy living room or relaxing on the spacious deck. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Bend in this welcoming and idyllic cabin.',
  latitude: 44.0724,
  longitude: -121.3153
)

Home.create!(
  address: '789 Lakeside Avenue',
  city: 'Lake Placid',
  state: 'NY',
  zipcode: '12946',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Discover the enchanting beauty of Lake Placid, New York, in this modern dwelling at 789 Lakeside Avenue. With five bedrooms and four and a half baths, this home offers contemporary design surrounded by the stunning landscapes of the Adirondacks. Built in 2006, the property features sleek architecture and spacious living. Imagine enjoying the private backyard with views of Mirror Lake or exploring the nearby Olympic Village. The 3500 square feet of living space provides comfort and style. Whether youre a nature lover or seeking a tranquil lifestyle, this dwelling in Lake Placid offers the perfect blend of luxury and natural beauty.',
  latitude: 44.2895,
  longitude: -73.9837
)

Home.create!(
  address: '234 Evergreen Lane',
  city: 'Helena',
  state: 'MT',
  zipcode: '59601',
  price: 650000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2600,
  lot_size: 0.8,
  built_date: 2011,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Experience the tranquility of Helena, Montana, in this elegant single-family home at 234 Evergreen Lane. With four bedrooms and three and a half baths, this residence offers a perfect blend of modern luxury and natural beauty. Built in 2011, the property features stylish design and spacious living areas. Imagine enjoying the breathtaking views of the surrounding mountains from your own backyard or exploring the nearby trails. The 2600 square feet of living space provides both comfort and style. Make Helena your home and enjoy the peaceful charm of the Treasure State.',
  latitude: 46.5891,
  longitude: -112.0391
)

Home.create!(
  address: '567 Mountain Drive',
  city: 'Eugene',
  state: 'OR',
  zipcode: '97405',
  price: 620000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2014,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the serene beauty of Eugene, Oregon, with this charming cabin at 567 Mountain Drive. Offering three bedrooms and two and a half baths, this cabin is a retreat for all seasons. Nestled on a 0.7-acre lot and built in 2014, the property combines rustic charm with modern comfort. Imagine enjoying the peaceful surroundings from the cozy living room or relaxing on the spacious deck. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Eugene in this inviting and idyllic cabin.',
  latitude: 44.0208,
  longitude: -123.1065
)

Home.create!(
  address: '890 Cedarwood Avenue',
  city: 'Aspen',
  state: 'CO',
  zipcode: '81611',
  price: 1300000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3800,
  lot_size: 1.2,
  built_date: 2008,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Indulge in the luxury of Aspen, Colorado, with this exquisite dwelling at 890 Cedarwood Avenue. Boasting five bedrooms and four and a half baths, this home offers sophistication and comfort in the heart of the Rockies. Built in 2008, the property features elegant design and breathtaking mountain views. Imagine entertaining in the spacious living areas or relaxing in the private outdoor spaces. The 3800 square feet of living space provides ample room for both intimate gatherings and larger events. Experience the opulence of Aspen living in this stunning and meticulously crafted dwelling.',
  latitude: 39.1821,
  longitude: -106.8156
)

Home.create!(
  address: '123 Redwood Avenue',
  city: 'Boulder',
  state: 'CO',
  zipcode: '80301',
  price: 720000,
  bedrooms: 4,
  bathrooms: 3.5,
  square_feet: 2700,
  lot_size: 0.9,
  built_date: 2012,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the vibrant city of Boulder, Colorado, in this elegant single-family home at 123 Redwood Avenue. With four bedrooms and three and a half baths, this residence offers a perfect blend of modern luxury and mountain living. Built in 2012, the property features stylish design and spacious living areas. Imagine enjoying the views of the Flatirons from your own backyard or exploring the nearby hiking trails. The 2700 square feet of living space provides both comfort and style. Make Boulder your home and embrace the outdoor culture and artistic atmosphere.',
  latitude: 40.0150,
  longitude: -105.2705
)

Home.create!(
  address: '456 Lakeside Drive',
  city: 'Portland',
  state: 'OR',
  zipcode: '97201',
  price: 650000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2300,
  lot_size: 0.8,
  built_date: 2013,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the Pacific Northwest with this charming cabin at 456 Lakeside Drive in Portland, Oregon. Offering three bedrooms and two and a half baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2013, the property combines rustic charm with modern comfort. Imagine enjoying the serene views of the nearby lake from the cozy living room or exploring the lush surroundings. The 2300 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Portland in this welcoming and idyllic cabin.',
  latitude: 45.5122,
  longitude: -122.6587
)

Home.create!(
  address: '789 Pinehill Lane',
  city: 'Bozeman',
  state: 'MT',
  zipcode: '59715',
  price: 850000,
  bedrooms: 5,
  bathrooms: 4,
  square_feet: 3200,
  lot_size: 1.1,
  built_date: 2010,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the beauty of Bozeman, Montana, with this modern dwelling at 789 Pinehill Lane. Boasting five bedrooms and four baths, this home offers contemporary design surrounded by the stunning landscapes of the Gallatin Valley. Built in 2010, the property features sleek architecture and spacious living. Imagine enjoying the private backyard with views of the Bridger Range or exploring the nearby hiking trails. The 3200 square feet of living space provides comfort and style. Whether you\'re an outdoor enthusiast or seeking a vibrant community, this dwelling in Bozeman offers the perfect blend of luxury and natural beauty.',
  latitude: 45.6770,
  longitude: -111.0429
)

Home.create!(
  address: '234 Elm Street',
  city: 'Stowe',
  state: 'VT',
  zipcode: '05672',
  price: 580000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2100,
  lot_size: 0.7,
  built_date: 2015,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the charm of Stowe, Vermont, in this elegant single-family home at 234 Elm Street. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and New England living. Built in 2015, the property features classic design and cozy living areas. Imagine strolling through the picturesque village or skiing on the nearby slopes. The 2100 square feet of living space provides both comfort and style. Make Stowe your home and experience the beauty and tranquility of this quintessential Vermont town.',
  latitude: 44.4654,
  longitude: -72.6874
)

Home.create!(
  address: '567 Oak Lane',
  city: 'Grand Marais',
  state: 'MN',
  zipcode: '55604',
  price: 620000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.8,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the North Shore with this charming cabin at 567 Oak Lane in Grand Marais, Minnesota. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the peaceful views of Lake Superior from the cozy living room or exploring the nearby hiking trails. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Grand Marais in this welcoming and idyllic cabin.',
  latitude: 47.7509,
  longitude: -90.3347
)

Home.create!(
  address: '890 Maplewood Drive',
  city: 'Waitsfield',
  state: 'VT',
  zipcode: '05673',
  price: 780000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3400,
  lot_size: 1.0,
  built_date: 2009,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the scenic beauty of Waitsfield, Vermont, with this modern dwelling at 890 Maplewood Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the picturesque landscapes of the Mad River Valley. Built in 2009, the property features sleek architecture and spacious living. Imagine enjoying the private backyard with views of the Green Mountains or exploring the charming village. The 3400 square feet of living space provides comfort and style. Whether you seek outdoor adventures or a close-knit community, this dwelling in Waitsfield offers the perfect blend of luxury and Vermont charm.',
  latitude: 44.1848,
  longitude: -72.8314
)

Home.create!(
  address: '234 Pine Street',
  city: 'Manchester',
  state: 'VT',
  zipcode: '05255',
  price: 580000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2100,
  lot_size: 0.7,
  built_date: 2015,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the charm of Manchester, Vermont, in this elegant single-family home at 234 Pine Street. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and New England living. Built in 2015, the property features classic design and cozy living areas. Imagine strolling through the historic village or enjoying the nearby mountains. The 2100 square feet of living space provides both comfort and style. Make Manchester your home and experience the beauty and tranquility of this quintessential Vermont town.',
  latitude: 43.1636,
  longitude: -73.0664
)

Home.create!(
  address: '567 Maple Avenue',
  city: 'Harbor Springs',
  state: 'MI',
  zipcode: '49740',
  price: 620000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.8,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the northern beauty of Harbor Springs, Michigan, with this inviting cabin at 567 Maple Avenue. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the scenic views of Lake Michigan from the cozy living room or exploring the nearby trails. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Harbor Springs in this welcoming and idyllic cabin.',
  latitude: 45.4289,
  longitude: -84.9919
)

Home.create!(
  address: '890 Oakwood Lane',
  city: 'Duluth',
  state: 'MN',
  zipcode: '55803',
  price: 780000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3400,
  lot_size: 1.0,
  built_date: 2009,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the northern beauty of Duluth, Minnesota, with this modern dwelling at 890 Oakwood Lane. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the stunning landscapes of Lake Superior. Built in 2009, the property features sleek architecture and spacious living. Imagine enjoying the private wooded views from the backyard or exploring the nearby hiking trails. The 3400 square feet of living space provides comfort and style. Whether you seek lakeside living or a serene escape, this dwelling in Duluth offers the perfect blend of luxury and northern charm.',
  latitude: 46.8302,
  longitude: -92.2195
)

Home.create!(
  address: '123 Birch Lane',
  city: 'Traverse City',
  state: 'MI',
  zipcode: '49684',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the charm of Traverse City, Michigan, in this elegant single-family home at 123 Birch Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and northern living. Built in 2013, the property features classic design and cozy living areas. Imagine strolling through the vibrant downtown or enjoying the nearby shores of Lake Michigan. The 2200 square feet of living space provides both comfort and style. Make Traverse City your home and experience the beauty and warmth of this delightful northern town.',
  latitude: 44.7631,
  longitude: -85.6206
)

Home.create!(
  address: '456 Cedar Street',
  city: 'Ely',
  state: 'MN',
  zipcode: '55731',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the wilderness charm of Ely, Minnesota, with this inviting cabin at 456 Cedar Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on a 0.7-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the peaceful views of the Boundary Waters from the cozy living room or exploring the nearby lakes and forests. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Ely in this welcoming and idyllic cabin.',
  latitude: 47.9030,
  longitude: -91.8678
)

Home.create!(
  address: '789 Pinecrest Drive',
  city: 'Grand Marais',
  state: 'MN',
  zipcode: '55604',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the beauty of Grand Marais, Minnesota, with this modern dwelling at 789 Pinecrest Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the pristine landscapes of Lake Superior. Built in 2006, the property features sleek architecture and spacious living. Imagine enjoying the private lakeside views from the backyard or exploring the renowned Gunflint Trail. The 3500 square feet of living space provides comfort and style. Whether you seek waterfront living or a peaceful retreat, this dwelling in Grand Marais offers the perfect blend of luxury and northern charm.',
  latitude: 47.7509,
  longitude: -90.3347
)

Home.create!(
  address: '234 Elm Street',
  city: 'Woodstock',
  state: 'VT',
  zipcode: '05091',
  price: 580000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2100,
  lot_size: 0.7,
  built_date: 2015,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the historic charm of Woodstock, Vermont, in this elegant single-family home at 234 Elm Street. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and New England living. Built in 2015, the property features classic design and cozy living areas. Imagine strolling along the covered bridges or exploring the picturesque countryside. The 2100 square feet of living space provides both comfort and style. Make Woodstock your home and experience the beauty and tranquility of this quintessential New England town.',
  latitude: 43.6246,
  longitude: -72.5200
)

Home.create!(
  address: '567 Maple Lane',
  city: 'Camden',
  state: 'ME',
  zipcode: '04843',
  price: 620000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.8,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the coastal beauty of Camden, Maine, with this inviting cabin at 567 Maple Lane. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on a 0.8-acre lot and built in 2012, the property combines rustic charm with modern comfort. Imagine enjoying the views of Penobscot Bay from the cozy living room or exploring the charming downtown. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Camden in this welcoming and idyllic cabin.',
  latitude: 44.2098,
  longitude: -69.0640
)

Home.create!(
  address: '890 Oakwood Drive',
  city: 'Concord',
  state: 'NH',
  zipcode: '03301',
  price: 780000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3400,
  lot_size: 1.0,
  built_date: 2009,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the beauty of Concord, New Hampshire, with this modern dwelling at 890 Oakwood Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the historic landscapes of the Granite State. Built in 2009, the property features sleek architecture and spacious living. Imagine enjoying the peaceful views of the Merrimack River from the backyard or exploring the vibrant downtown. The 3400 square feet of living space provides comfort and style. Whether you seek New England living or a cultural hub, this dwelling in Concord offers the perfect blend of luxury and regional charm.',
  latitude: 43.2081,
  longitude: -71.5375
)

Home.create!(
  address: '28 Pine Lane',
  city: 'Stowe',
  state: 'VT',
  zipcode: '05672',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the picturesque beauty of Stowe, Vermont, in this elegant single-family home at 28 Pine Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and New England living. Built in 2013, the property features classic design and cozy living areas. Imagine skiing on the slopes of Mount Mansfield or enjoying the charming village atmosphere. The 2200 square feet of living space provides both comfort and style. Make Stowe your home and experience the beauty and tranquility of this renowned Vermont town.',
  latitude: 44.4654,
  longitude: -72.6874
)

Home.create!(
  address: '456 Maple Street',
  city: 'Portsmouth',
  state: 'NH',
  zipcode: '03801',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the coastal charm of Portsmouth, New Hampshire, with this inviting cabin at 456 Maple Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled in a historic neighborhood and built in 2012, the property combines rustic charm with modern comfort. Imagine walking along the scenic waterfront or exploring the vibrant downtown. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Portsmouth in this welcoming and idyllic cabin.',
  latitude: 43.0718,
  longitude: -70.7626
)

Home.create!(
  address: '789 Oakridge Drive',
  city: 'Lenox',
  state: 'MA',
  zipcode: '01240',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the cultural richness of Lenox, Massachusetts, with this modern dwelling at 789 Oakridge Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the Berkshires scenic landscapes. Built in 2006, the property features sleek architecture and spacious living. Imagine attending performances at Tanglewood or exploring the charming boutiques and galleries. The 3500 square feet of living space provides comfort and style. Whether you seek New England living or an artsy retreat, this dwelling in Lenox offers the perfect blend of luxury and regional charm.',
  latitude: 42.3584,
  longitude: -73.2835
)

Home.create!(
  address: '234 Birch Street',
  city: 'Grand Forks',
  state: 'ND',
  zipcode: '58201',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the welcoming atmosphere of Grand Forks, North Dakota, in this elegant single-family home at 234 Birch Street. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and northern living. Built in 2013, the property features classic design and comfortable living areas. Imagine enjoying the serene Red River or exploring the vibrant downtown. The 2200 square feet of living space provides both comfort and style. Make Grand Forks your home and experience the beauty and warmth of this friendly northern town.',
  latitude: 47.9253,
  longitude: -97.0329
)

Home.create!(
  address: '456 Oakwood Avenue',
  city: 'Aspen',
  state: 'CO',
  zipcode: '81611',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the mountain charm of Aspen, Colorado, with this inviting cabin at 456 Oakwood Avenue. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled in the heart of the Rockies and built in 2012, the property combines rustic charm with modern comfort. Imagine skiing on the world-renowned slopes or enjoying the vibrant cultural scene. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Aspen in this welcoming and idyllic cabin.',
  latitude: 39.1911,
  longitude: -106.8175
)

Home.create!(
  address: '789 Elmwood Lane',
  city: 'Missoula',
  state: 'MT',
  zipcode: '59801',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the beauty of Missoula, Montana, with this modern dwelling at 789 Elmwood Lane. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the stunning landscapes of Big Sky Country. Built in 2006, the property features sleek architecture and spacious living. Imagine exploring the nearby Bitterroot Mountains or enjoying the lively arts and music scene. The 3500 square feet of living space provides comfort and style. Whether you seek mountain living or a vibrant community, this dwelling in Missoula offers the perfect blend of luxury and regional charm.',
  latitude: 46.8625,
  longitude: -114.0125
)

Home.create!(
  address: '123 Cedar Avenue',
  city: 'Burlington',
  state: 'VT',
  zipcode: '05401',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the vibrant charm of Burlington, Vermont, in this elegant single-family home at 123 Cedar Avenue. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and New England living. Built in 2013, the property features classic design and inviting living areas. Imagine strolling along the shores of Lake Champlain or exploring the eclectic downtown scene. The 2200 square feet of living space provides both comfort and style. Make Burlington your home and experience the beauty and liveliness of this northern town.',
  latitude: 44.4759,
  longitude: -73.2121
)

Home.create!(
  address: '456 Redwood Street',
  city: 'Bend',
  state: 'OR',
  zipcode: '97701',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the outdoor paradise of Bend, Oregon, with this inviting cabin at 456 Redwood Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled in the high desert and built in 2012, the property combines rustic charm with modern comfort. Imagine hiking the trails of the Deschutes National Forest or enjoying the craft beer scene. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Bend in this welcoming and idyllic cabin.',
  latitude: 44.0608,
  longitude: -121.3153
)

Home.create!(
  address: '789 Pinecrest Drive',
  city: 'Bozeman',
  state: 'MT',
  zipcode: '59715',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the beauty of Bozeman, Montana, with this modern dwelling at 789 Pinecrest Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the breathtaking landscapes of the Gallatin Valley. Built in 2006, the property features sleek architecture and spacious living. Imagine fly-fishing on the Madison River or enjoying the cultural events in downtown Bozeman. The 3500 square feet of living space provides comfort and style. Whether you seek mountain living or a vibrant community, this dwelling in Bozeman offers the perfect blend of luxury and regional charm.',
  latitude: 45.6770,
  longitude: -111.0429
)

Home.create!(
  address: '234 Spruce Lane',
  city: 'Duluth',
  state: 'MN',
  zipcode: '55811',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the beauty of Duluth, Minnesota, in this elegant single-family home at 234 Spruce Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and northern living. Built in 2013, the property features classic design and comfortable living areas. Imagine exploring the shores of Lake Superior or hiking in the scenic hills. The 2200 square feet of living space provides both comfort and style. Make Duluth your home and experience the beauty and charm of this unique northern town.',
  latitude: 46.7867,
  longitude: -92.1005
)

Home.create!(
  address: '456 Hickory Street',
  city: 'Fairbanks',
  state: 'AK',
  zipcode: '99701',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the wild beauty of Fairbanks, Alaska, with this inviting cabin at 456 Hickory Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled in the heart of the Last Frontier and built in 2012, the property combines rustic charm with modern comfort. Imagine experiencing the Northern Lights from your backyard or exploring the vast wilderness. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Fairbanks in this welcoming and idyllic cabin.',
  latitude: 64.8378,
  longitude: -147.7164
)

Home.create!(
  address: '789 Cedarwood Drive',
  city: 'Bismarck',
  state: 'ND',
  zipcode: '58501',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the charm of Bismarck, North Dakota, with this modern dwelling at 789 Cedarwood Drive. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the scenic landscapes of the Missouri River. Built in 2006, the property features sleek architecture and spacious living. Imagine fishing in the river or enjoying the friendly community atmosphere. The 3500 square feet of living space provides comfort and style. Whether you seek a quiet retreat or a family-friendly environment, this dwelling in Bismarck offers the perfect blend of luxury and regional charm.',
  latitude: 46.8139,
  longitude: -100.7790
)

Home.create!(
  address: '123 Birchwood Lane',
  city: 'Sault Ste. Marie',
  state: 'MI',
  zipcode: '49783',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the charm of Sault Ste. Marie, Michigan, in this elegant single-family home at 123 Birchwood Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and northern living. Built in 2013, the property features classic design and comfortable living areas. Imagine watching ships pass through the Soo Locks or exploring the scenic Upper Peninsula. The 2200 square feet of living space provides both comfort and style. Make Sault Ste. Marie your home and experience the beauty and tranquility of this unique northern town.',
  latitude: 46.4922,
  longitude: -84.3640
)

Home.create!(
  address: '456 Maplewood Street',
  city: 'Coeur d Alene',
  state: 'ID',
  zipcode: '83814',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the scenic beauty of Coeur d Alene, Idaho, with this inviting cabin at 456 Maplewood Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on the shores of Lake Coeur d\'Alene and built in 2012, the property combines rustic charm with modern comfort. Imagine hiking in the nearby national forests or enjoying water activities on the lake. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Coeur d\'Alene in this welcoming and idyllic cabin.',
  latitude: 47.6732,
  longitude: -116.7813
)

Home.create!(
  address: '789 Cedar Lane',
  city: 'Juneau',
  state: 'AK',
  zipcode: '99801',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the natural beauty of Juneau, Alaska, with this modern dwelling at 789 Cedar Lane. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the majestic landscapes of Southeast Alaska. Built in 2006, the property features sleek architecture and spacious living. Imagine whale watching from your balcony or exploring the nearby glaciers. The 3500 square feet of living space provides comfort and style. Whether you seek outdoor adventures or a laid-back lifestyle, this dwelling in Juneau offers the perfect blend of luxury and regional charm.',
  latitude: 58.3019,
  longitude: -134.4197
)

Home.create!(
  address: '123 Pinecrest Lane',
  city: 'Ely',
  state: 'MN',
  zipcode: '55731',
  price: 550000,
  bedrooms: 3,
  bathrooms: 2.5,
  square_feet: 2200,
  lot_size: 0.6,
  built_date: 2013,
  property_type: 'Single-Family',
  seller_id: 1,
  description: 'Discover the tranquility of Ely, Minnesota, in this elegant single-family home at 123 Pinecrest Lane. With three bedrooms and two and a half baths, this residence offers a perfect blend of modern luxury and northern living. Built in 2013, the property features classic design and comfortable living areas. Imagine canoeing on the Boundary Waters or exploring the scenic beauty of the Northwoods. The 2200 square feet of living space provides both comfort and style. Make Ely your home and experience the charm and natural beauty of this unique northern town.',
  latitude: 47.9022,
  longitude: -91.8678
)

Home.create!(
  address: '456 Cedarwood Street',
  city: 'Sandpoint',
  state: 'ID',
  zipcode: '83864',
  price: 600000,
  bedrooms: 4,
  bathrooms: 3,
  square_feet: 2400,
  lot_size: 0.7,
  built_date: 2012,
  property_type: 'Cabin',
  seller_id: 1,
  description: 'Escape to the scenic beauty of Sandpoint, Idaho, with this inviting cabin at 456 Cedarwood Street. Offering four bedrooms and three baths, this cabin is a retreat for all seasons. Nestled on the shores of Lake Pend Oreille and built in 2012, the property combines rustic charm with modern comfort. Imagine skiing at Schweitzer Mountain or enjoying the vibrant arts community. The 2400 square feet of living space provides ample room for relaxation and entertaining. Experience the magic of Sandpoint in this welcoming and idyllic cabin.',
  latitude: 48.2766,
  longitude: -116.5535
)

Home.create!(
  address: '789 Redwood Lane',
  city: 'Sitka',
  state: 'AK',
  zipcode: '99835',
  price: 800000,
  bedrooms: 5,
  bathrooms: 4.5,
  square_feet: 3500,
  lot_size: 1.0,
  built_date: 2006,
  property_type: 'Dwelling',
  seller_id: 1,
  description: 'Immerse yourself in the coastal beauty of Sitka, Alaska, with this modern dwelling at 789 Redwood Lane. Boasting five bedrooms and four and a half baths, this home offers contemporary design surrounded by the majestic landscapes of Southeast Alaska. Built in 2006, the property features sleek architecture and spacious living. Imagine whale watching from your balcony or exploring the rich history of Sitka. The 3500 square feet of living space provides comfort and style. Whether you seek outdoor adventures or a laid-back lifestyle, this dwelling in Sitka offers the perfect blend of luxury and regional charm.',
  latitude: 57.0531,
  longitude: -135.3300
)


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