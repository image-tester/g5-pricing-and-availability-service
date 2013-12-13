module LocationsHelper
  
  def pricing_service(unit)
    unit.price_url ? unit.price_url : "#"
  end
  
end
