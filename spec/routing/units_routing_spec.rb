require "spec_helper"

describe UnitsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/locations/1/units")).to route_to("units#index", location_id: '1')
    end

    it "routes to #new" do
      expect(get("/locations/1/units/new")).to route_to("units#new", location_id: '1')
    end

    it "routes to #show" do
      expect(get("/locations/1/units/1")).to route_to("units#show", :id => "1", location_id: '1')
    end

    it "routes to #edit" do
      expect(get("/locations/1/units/1/edit")).to route_to("units#edit", :id => "1", location_id: '1')
    end

    it "routes to #create" do
      expect(post("/locations/1/units")).to route_to("units#create", location_id: '1')
    end

    it "routes to #update" do
      expect(put("/locations/1/units/1")).to route_to("units#update", :id => "1", location_id: '1')
    end

    it "routes to #destroy" do
      expect(delete("/locations/1/units/1")).to route_to("units#destroy", :id => "1", location_id: '1')
    end

  end
end
