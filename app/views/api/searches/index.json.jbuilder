json.array! @searches do |search|
  json.extract! search, :id, :price_min, :price_max, :beds, :baths, :home_type, :searcher_id, :created_at, :updated_at
end