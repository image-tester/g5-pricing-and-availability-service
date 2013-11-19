require 'spec_helper'

describe UnitsController do

  before(:each) do
    @location = Location.create! "urn" => "g5-cl-6cx7rin-hollywood", "name" => "Hollywood"
  end

  # This should return the minimal set of attributes required to create a valid
  # Unit. As you add validations to Unit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "Cedar Point" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UnitsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all units as @units" do
      unit = @location.units.create! valid_attributes
      get :index, {location_id: @location.to_param}, valid_session
      expect(assigns(:units)).to eq([unit])
    end

    it "renders the locations index template" do
      get :index, {location_id: @location.to_param}, valid_session
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "assigns a new unit as @unit" do
      get :new, {location_id: @location.to_param}, valid_session
      expect(assigns(:unit)).to be_a_new(Unit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Unit" do
        expect {
          post :create, {:unit => valid_attributes, location_id: @location.to_param}, valid_session
        }.to change(Unit, :count).by(1)
      end

      it "assigns a newly created unit as @unit" do
        post :create, {:unit => valid_attributes, location_id: @location.to_param}, valid_session
        expect(assigns(:unit)).to be_a(Unit)
        expect(assigns(:unit)).to be_persisted
      end

      it "redirects to the location page" do
        post :create, {:unit => valid_attributes, location_id: @location.to_param}, valid_session
        response.should redirect_to(@location)
        flash[:notice].should eq "Unit was successfully created."
      end

      it "does not raise an error" do
        expect {post :create, :unit => {title: "Cedar Point"}, location_id: @location.to_param}.not_to raise_error()
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved unit as @unit" do
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        post :create, {:unit => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(assigns(:unit)).to be_a_new(Unit)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        post :create, {:unit => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested unit" do
        unit = @location.units.create! valid_attributes
        # Assuming there are no other units in the database, this
        # specifies that the Unit created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Unit.any_instance.should_receive(:update).with({ "title" => "MyUnit" })
        put :update, {:id => unit.to_param, :unit => { "title" => "MyUnit" }, location_id: @location.to_param}, valid_session
      end

      it "assigns the requested unit as @unit" do
        unit = @location.units.create! valid_attributes
        put :update, {:id => unit.to_param, :unit => valid_attributes, location_id: @location.to_param}, valid_session
        expect(assigns(:unit)).to eq(unit)
      end

      it "redirects to the location page" do
        unit = @location.units.create! valid_attributes
        put :update, {:id => unit.to_param, :unit => valid_attributes, location_id: @location.to_param}, valid_session
        expect(response).to redirect_to(@location)
        flash[:notice].should eq "Unit was successfully updated."
      end
    end

    describe "with invalid params" do
      it "assigns the unit as @unit" do
        unit = @location.units.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        put :update, {:id => unit.to_param, :unit => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(assigns(:unit)).to eq(unit)
      end

      it "re-renders the 'edit' template" do
        unit = @location.units.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        put :update, {:id => unit.to_param, :unit => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested unit" do
      unit = @location.units.create! valid_attributes
      expect {
        delete :destroy, {:id => unit.to_param, location_id: @location.to_param}, valid_session
      }.to change(Unit, :count).by(-1)
    end

    it "redirects to the units list" do
      unit = @location.units.create! valid_attributes
      delete :destroy, {:id => unit.to_param, location_id: @location.to_param}, valid_session
      expect(response).to redirect_to(@location)
    end
  end

end
