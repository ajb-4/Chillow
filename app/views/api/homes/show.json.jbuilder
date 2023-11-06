json.home do
  json.extract! @home, :id, :address, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :square_feet, :lot_size, :built_date, :property_type, :seller_id, :unit_number, :description, :created_at

  photoArr = []
  if @home.photos.attached?
    @home.photos.each do |photo|
      photoArr << url_for(photo)
    end
  end
  json.photoArray photoArr
end