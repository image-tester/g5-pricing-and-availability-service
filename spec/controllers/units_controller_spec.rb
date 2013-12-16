require 'spec_helper'

describe FloorplansController do

  before(:each) do
    @location = Location.create! "urn" => "g5-cl-6cx7rin-hollywood", "name" => "Hollywood"
  end

  # This should return the minimal set of attributes required to create a valid
  # Floorplan. As you add validations to Floorplan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "Cedar Point" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FloorplansController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all floorplans as @floorplans" do
      floorplan = @location.floorplans.create! valid_attributes
      get :index, {location_id: @location.to_param}, valid_session
      expect(assigns(:floorplans)).to eq([floorplan])
    end

    it "renders the locations index template" do
      get :index, {location_id: @location.to_param}, valid_session
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "assigns a new floorplan as @floorplan" do
      get :new, {location_id: @location.to_param}, valid_session
      expect(assigns(:floorplan)).to be_a_new(Floorplan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Floorplan" do
        expect {
          post :create, {:floorplan => valid_attributes, location_id: @location.to_param}, valid_session
        }.to change(Floorplan, :count).by(1)
      end

      it "assigns a newly created floorplan as @floorplan" do
        post :create, {:floorplan => valid_attributes, location_id: @location.to_param}, valid_session
        expect(assigns(:floorplan)).to be_a(Floorplan)
        expect(assigns(:floorplan)).to be_persisted
      end

      it "redirects to the location page" do
        post :create, {:floorplan => valid_attributes, location_id: @location.to_param}, valid_session
        response.should redirect_to(@location)
        flash[:notice].should eq "Floorplan was successfully created."
      end

      it "does not raise an error" do
        expect {post :create, :floorplan => {title: "Cedar Point"}, location_id: @location.to_param}.not_to raise_error()
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved floorplan as @floorplan" do
        # Trigger the behavior that occurs when invalid params are submitted
        Floorplan.any_instance.stub(:save).and_return(false)
        post :create, {:floorplan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(assigns(:floorplan)).to be_a_new(Floorplan)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Floorplan.any_instance.stub(:save).and_return(false)
        post :create, {:floorplan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested floorplan" do
        floorplan = @location.floorplans.create! valid_attributes
        # Assuming there are no other floorplans in the database, this
        # specifies that the Floorplan created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Floorplan.any_instance.should_receive(:update).with({ "title" => "MyFloorplan" })
        put :update, {:id => floorplan.to_param, :floorplan => { "title" => "MyFloorplan" }, location_id: @location.to_param}, valid_session
      end

      it "assigns the requested floorplan as @floorplan" do
        floorplan = @location.floorplans.create! valid_attributes
        put :update, {:id => floorplan.to_param, :floorplan => valid_attributes, location_id: @location.to_param}, valid_session
        expect(assigns(:floorplan)).to eq(floorplan)
      end

      it "redirects to the location page" do
        floorplan = @location.floorplans.create! valid_attributes
        put :update, {:id => floorplan.to_param, :floorplan => valid_attributes, location_id: @location.to_param}, valid_session
        expect(response).to redirect_to(@location)
        flash[:notice].should eq "Floorplan was successfully updated."
      end
    end

    describe "with invalid params" do
      it "assigns the floorplan as @floorplan" do
        floorplan = @location.floorplans.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Floorplan.any_instance.stub(:save).and_return(false)
        put :update, {:id => floorplan.to_param, :floorplan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(assigns(:floorplan)).to eq(floorplan)
      end

      it "re-renders the 'edit' template" do
        floorplan = @location.floorplans.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Floorplan.any_instance.stub(:save).and_return(false)
        put :update, {:id => floorplan.to_param, :floorplan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested floorplan" do
      floorplan = @location.floorplans.create! valid_attributes
      expect {
        delete :destroy, {:id => floorplan.to_param, location_id: @location.to_param}, valid_session
      }.to change(Floorplan, :count).by(-1)
    end

    it "redirects to the floorplans list" do
      floorplan = @location.floorplans.create! valid_attributes
      delete :destroy, {:id => floorplan.to_param, location_id: @location.to_param}, valid_session
      expect(response).to redirect_to(@location)
    end
  end

end
