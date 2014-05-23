json.array!(@floor_plans) do |floor_plan|
  json.extract! floor_plan, :title, :available_now, :available_soon, :beds, :baths, :size, :price, :deposit, :image_url, :price_url
end
