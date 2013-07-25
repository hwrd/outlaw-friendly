json.array!(@locations) do |location|
  json.extract! location, :name, :address, :website, :more, :latitude, :longitude
  json.url location_url(location, format: :json)
end
