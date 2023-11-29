@homes.each do |home|
  json.set! home.id do
    json.extract! home, :id, :address, :city, :state,
      :zipcode, :price, :bedrooms, :bathrooms, :square_feet,
      :lot_size, :built_date, :property_type, :seller_id,
      :created_at, :unit_number, :description, :latitude, :longitude
    photoArr = []
    if home.photos.attached?
      home.photos.each do |photo|
        photoArr << url_for(photo)
      end
    end
    json.photoArray photoArr
  end
end