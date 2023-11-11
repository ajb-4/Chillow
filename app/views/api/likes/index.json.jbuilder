json.array! @likes do |like|
  json.extract! like, :id, :liker_id, :home_id, :created_at, :updated_at
end