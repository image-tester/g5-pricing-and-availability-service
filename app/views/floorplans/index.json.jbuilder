json.array!(@units) do |unit|
  json.extract! unit, :title, :available_now, :available_soon, :beds, :baths, :size, :price, :deposit, :floorplan
  json.url unit_url(unit, format: :json)
end
