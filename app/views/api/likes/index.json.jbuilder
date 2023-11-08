json.likes @likes do |like|
  json.id like.id
  json.liker_id like.liker_id
  json.home_id like.home_id
  json.created_at like.created_at
  json.updated_at like.updated_at
end