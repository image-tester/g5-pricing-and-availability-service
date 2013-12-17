json.array!(@floor_plans) do |floor_plan|
  json.extract! floor_plan, :title, :available_now, :available_soon, :beds, :baths, :size, :price, :deposit, :floorplan, :price_url
  json.url floor_plan_url(floor_plan, format: :json)
end
