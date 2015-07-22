json.array!(@users) do |user|
  json.extract! user, :id, :nick, :city
  json.url user_url(user, format: :json)
end
