module LocationsHelper
  
  def pricing_service(floorplan)
    floorplan.price_url ? floorplan.price_url : "#"
  end
  
end
