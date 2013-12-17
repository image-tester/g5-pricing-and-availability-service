require "spec_helper"

describe FloorPlansController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/locations/1/floor_plans")).to route_to("floor_plans#index", location_id: '1')
    end

    it "routes to #new" do
      expect(get("/locations/1/floor_plans/new")).to route_to("floor_plans#new", location_id: '1')
    end

    it "routes to #show" do
      expect(get("/locations/1/floor_plans/1")).to route_to("floor_plans#show", :id => "1", location_id: '1')
    end

    it "routes to #edit" do
      expect(get("/locations/1/floor_plans/1/edit")).to route_to("floor_plans#edit", :id => "1", location_id: '1')
    end

    it "routes to #create" do
      expect(post("/locations/1/floor_plans")).to route_to("floor_plans#create", location_id: '1')
    end

    it "routes to #update" do
      expect(put("/locations/1/floor_plans/1")).to route_to("floor_plans#update", :id => "1", location_id: '1')
    end

    it "routes to #destroy" do
      expect(delete("/locations/1/floor_plans/1")).to route_to("floor_plans#destroy", :id => "1", location_id: '1')
    end

  end
end
