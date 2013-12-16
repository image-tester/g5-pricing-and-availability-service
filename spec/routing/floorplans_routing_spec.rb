require "spec_helper"

describe FloorplansController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/locations/1/floorplans")).to route_to("floorplans#index", location_id: '1')
    end

    it "routes to #new" do
      expect(get("/locations/1/floorplans/new")).to route_to("floorplans#new", location_id: '1')
    end

    it "routes to #show" do
      expect(get("/locations/1/floorplans/1")).to route_to("floorplans#show", :id => "1", location_id: '1')
    end

    it "routes to #edit" do
      expect(get("/locations/1/floorplans/1/edit")).to route_to("floorplans#edit", :id => "1", location_id: '1')
    end

    it "routes to #create" do
      expect(post("/locations/1/floorplans")).to route_to("floorplans#create", location_id: '1')
    end

    it "routes to #update" do
      expect(put("/locations/1/floorplans/1")).to route_to("floorplans#update", :id => "1", location_id: '1')
    end

    it "routes to #destroy" do
      expect(delete("/locations/1/floorplans/1")).to route_to("floorplans#destroy", :id => "1", location_id: '1')
    end

  end
end
