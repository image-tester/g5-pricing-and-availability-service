module LocationsHelper
  
  def pricing_service(floor_plan)
    floor_plan.price_url.blank? ? "#" : floor_plan.price_url
  end
  
end
