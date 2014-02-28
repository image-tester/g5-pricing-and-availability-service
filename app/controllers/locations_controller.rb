class LocationsController < ApplicationController
  http_basic_authenticate_with(name: ENV["HTTP_BASIC_AUTH_NAME"], password: ENV["HTTP_BASIC_AUTH_PASSWORD"], except: :show) if ENV["HTTP_BASIC_AUTH_NAME"] && ENV["HTTP_BASIC_AUTH_PASSWORD"]
  before_action :set_location, only: [:show, :widget, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
    @floor_plans = @location.floor_plans.rank(:row_order)
    @title = "#{@location.name} Floor Plans"
  end

  # This is the markup served to the widget
  def widget
    @floor_plans = @location.floor_plans.rank(:row_order)
  end

  def new
    @location = Location.new
  end

  def edit
    @floor_plans = @location.floor_plans
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:urn, :name)
    end
end
