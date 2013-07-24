json.array!(@locations) do |location|
  json.extract! location, :name, :address, :latitude, :longitude
  json.url location_url(location, format: :json)
end
