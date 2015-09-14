json.array!(@users) do |user|
  json.extract! user, :name, :items, :similarity
  json.url user_url(user, format: :json)
end
