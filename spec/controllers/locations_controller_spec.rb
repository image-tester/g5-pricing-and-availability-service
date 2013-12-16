require 'spec_helper'

describe LocationsController do

  # This should return the minimal set of attributes required to create a valid
  # Location. As you add validations to Location, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "urn" => "g5-cl-6cx7rin-hollywood", "name" => "Hollywood" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LocationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all locations as @locations" do
      location = Location.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:locations)).to eq([location])
    end

    it "renders the index template" do
      get :index, {}, valid_session
      expect(response).to render_template(:index)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index, {}, valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "assigns the requested location as @location" do
      location = Location.create! valid_attributes
      get :show, {:id => location.to_param}, valid_session
      expect(assigns(:location)).to eq(location)
    end

    it "renders the show template" do
      location = Location.create! valid_attributes
      get :show, {:id => location.to_param}, valid_session
      expect(response).to render_template(:show)
    end

    it "assigns the requested location's floorplans as @floorplans" do
      location = Location.create! valid_attributes
      floorplan1, floorplan2 = location.floorplans.create!, location.floorplans.create!
      get :show, {:id => location.to_param}, valid_session
      expect(assigns(:floorplans)).to eq([floorplan1, floorplan2])
    end
  end

  describe "GET new" do
    it "assigns a new location as @location" do
      get :new, {}, valid_session
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe "GET edit" do
    it "assigns the requested location as @location" do
      location = Location.create! valid_attributes
      get :edit, {:id => location.to_param}, valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, {:location => valid_attributes}, valid_session
        }.to change(Location, :count).by(1)
      end

      it "assigns a newly created location as @location" do
        post :create, {:location => valid_attributes}, valid_session
        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).to be_persisted
      end

      it "redirects to the created location" do
        post :create, {:location => valid_attributes}, valid_session
        expect(response).to redirect_to(Location.last)
        flash[:notice].should eq "Location was successfully created."
      end

      it "does not raise an error" do
        expect {post :create, :location => {urn: "g5-cl-whatever-3"}}.not_to raise_error()
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved location as @location" do
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        post :create, {:location => { "urn" => "invalid value" }}, valid_session
        assigns(:location).should be_a_new(Location)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        post :create, {:location => { "urn" => "invalid value" }}, valid_session
        response.should render_template("new")
      end

      it "raises an error" do
        expect {post :create}.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested location" do
        location = Location.create! valid_attributes
        # Assuming there are no other locations in the database, this
        # specifies that the Location created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Location.any_instance.should_receive(:update).with({ "urn" => "MyString", "name" => "MyName" })
        put :update, {:id => location.to_param, :location => { "urn" => "MyString", "name" => "MyName" }}, valid_session
      end

      it "assigns the requested location as @location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        expect(assigns(:location)).to eq(location)
      end

      it "redirects to the location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        expect(response).to redirect_to(location)
        flash[:notice].should eq "Location was successfully updated."
      end
    end

    describe "with invalid params" do
      it "assigns the location as @location" do
        location = Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :location => { "urn" => "invalid value" }}, valid_session
        expect(assigns(:location)).to eq(location)
      end

      it "re-renders the 'edit' template" do
        location = Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :location => { "urn" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, {:id => location.to_param}, valid_session
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = Location.create! valid_attributes
      delete :destroy, {:id => location.to_param}, valid_session
      response.should redirect_to(locations_url)
    end
  end

end
