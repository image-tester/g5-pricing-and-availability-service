json.array!(@locations) do |location|
  json.extract! location, :urn, :name
  json.url location_url(location, format: :json)
end
