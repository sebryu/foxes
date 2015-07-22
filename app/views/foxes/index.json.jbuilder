json.array!(@foxes) do |fox|
  json.extract! fox, :id, :name, :age, :color
  json.url fox_url(fox, format: :json)
end
