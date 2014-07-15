require 'spec_helper'

describe FloorPlansController do

  before(:each) do
    @location = Location.create! "urn" => "g5-cl-6cx7rin-hollywood", "name" => "Hollywood"
  end

  # This should return the minimal set of attributes required to create a valid
  # FloorPlan. As you add validations to FloorPlan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "Cedar Point" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FloorPlansController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    describe "with http basic auth" do
      before :each do
        http_login
      end

      it "assigns all floor_plans as @floor_plans" do
        floor_plan = @location.floor_plans.create! valid_attributes
        get :index, {location_id: @location.to_param}, valid_session
        expect(assigns(:floor_plans)).to eq([floor_plan])
      end

      it "renders the locations index template" do
        get :index, {location_id: @location.to_param}, valid_session
        expect(response).to render_template(:index)
      end
    end

    describe "without http basic auth" do
      it "renders the locations index template" do
        get :index, {location_id: @location.to_param}, valid_session
        expect(response.status).to eq(200)
      end

      it "doesn't allow creation of new floorplan" do
        get :new, {location_id: @location.to_param}, valid_session
        expect(response.status).to eq(401)
      end
    end

    describe "GET new" do
      describe "with http basic auth" do
        before :each do
          http_login
        end

        it "assigns a new floor_plan as @floor_plan" do
          get :new, {location_id: @location.to_param}, valid_session
          expect(assigns(:floor_plan)).to be_a_new(FloorPlan)
        end
      end

      describe "without http basic auth" do
        it "doesnt assign a new floor_plan as @floor_plan" do
          get :new, {location_id: @location.to_param}, valid_session
          expect(response.status).to eq(401)
        end
      end
    end
  end

  describe "POST create" do
    describe "with http basic auth" do
      before :each do
        http_login
      end

      describe "with valid params" do
        it "creates a new FloorPlan" do
          expect {
            post :create, {:floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
          }.to change(FloorPlan, :count).by(1)
        end

        it "assigns a newly created floor_plan as @floor_plan" do
          post :create, {:floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
          expect(assigns(:floor_plan)).to be_a(FloorPlan)
          expect(assigns(:floor_plan)).to be_persisted
        end

        it "redirects to the location page" do
          post :create, {:floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
          response.should redirect_to(@location)
          flash[:notice].should eq "Floor plan was successfully created."
        end

        it "does not raise an error" do
          expect {post :create, :floor_plan => {title: "Cedar Point"}, location_id: @location.to_param}.not_to raise_error()
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved floor_plan as @floor_plan" do
          # Trigger the behavior that occurs when invalid params are submitted
          FloorPlan.any_instance.stub(:save).and_return(false)
          post :create, {:floor_plan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
          expect(assigns(:floor_plan)).to be_a_new(FloorPlan)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          FloorPlan.any_instance.stub(:save).and_return(false)
          post :create, {:floor_plan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "without http basic auth" do
      it "doesnt create a new FloorPlan" do
        post :create, {:floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
        expect(response.status).to eq(401)
      end
    end
  end

  describe "PUT update" do
    describe "with http basic auth" do
      before :each do
        http_login
      end

      describe "with valid params" do
        it "updates the requested floor_plan" do
          floor_plan = @location.floor_plans.create! valid_attributes
          # Assuming there are no other floor_plans in the database, this
          # specifies that the FloorPlan created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          FloorPlan.any_instance.should_receive(:update).with({ "title" => "MyFloorPlan" })
          put :update, {:id => floor_plan.to_param, :floor_plan => { "title" => "MyFloorPlan" }, location_id: @location.to_param}, valid_session
        end

        it "assigns the requested floor_plan as @floor_plan" do
          floor_plan = @location.floor_plans.create! valid_attributes
          put :update, {:id => floor_plan.to_param, :floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
          expect(assigns(:floor_plan)).to eq(floor_plan)
        end

        it "redirects to the location page" do
          floor_plan = @location.floor_plans.create! valid_attributes
          put :update, {:id => floor_plan.to_param, :floor_plan => valid_attributes, location_id: @location.to_param}, valid_session
          expect(response).to redirect_to(@location)
          flash[:notice].should eq "Floor plan was successfully updated."
        end
      end

      describe "with invalid params" do
        it "assigns the floor_plan as @floor_plan" do
          floor_plan = @location.floor_plans.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          FloorPlan.any_instance.stub(:save).and_return(false)
          put :update, {:id => floor_plan.to_param, :floor_plan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
          expect(assigns(:floor_plan)).to eq(floor_plan)
        end

        it "re-renders the 'edit' template" do
          floor_plan = @location.floor_plans.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          FloorPlan.any_instance.stub(:save).and_return(false)
          put :update, {:id => floor_plan.to_param, :floor_plan => { "title" => "invalid value" }, location_id: @location.to_param}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "without http basic auth" do
      it "updates the requested floor_plan" do
        floor_plan = @location.floor_plans.create! valid_attributes
        put :update, {:id => floor_plan.to_param, :floor_plan => { "title" => "MyFloorPlan" }, location_id: @location.to_param}, valid_session
        expect(response.status).to eq(401)
      end
    end
  end

  describe "DELETE destroy" do
    describe "with http basic auth" do
      before :each do
        http_login
      end

      it "destroys the requested floor_plan" do
        floor_plan = @location.floor_plans.create! valid_attributes
        expect {
          delete :destroy, {:id => floor_plan.to_param, location_id: @location.to_param}, valid_session
        }.to change(FloorPlan, :count).by(-1)
      end

      it "redirects to the floor_plans list" do
        floor_plan = @location.floor_plans.create! valid_attributes
        delete :destroy, {:id => floor_plan.to_param, location_id: @location.to_param}, valid_session
        expect(response).to redirect_to(@location)
      end
    end

    describe "without http basic auth" do
      it "doesnt destroy the requested floor_plan" do
        floor_plan = @location.floor_plans.create! valid_attributes
        delete :destroy, {:id => floor_plan.to_param, location_id: @location.to_param}, valid_session
        expect(response.status).to eq(401)
      end
    end
  end
end
