require 'spec_helper'

describe "Floorplans" do
  
  def create_location
    visit locations_path
    click_link "New Location"
    fill_in "location_name", with: "Clearwater"
    fill_in "Urn", with: "g5-cl-8cz7tip-clearwater"
    click_button "Create Location"
  end

  def create_floorplan
    click_link "Create New Floorplan"
    fill_in "Title", with: "Cedar Point"
    fill_in "Available now", with: "2"
    fill_in "Available soon", with: "1"
    fill_in "Beds", with: "3"
    fill_in "Baths", with: "2"
    fill_in "Size", with: "1400"
    fill_in "Price", with: "1600"
    fill_in "Deposit", with: "0"
    fill_in "Floorplan", with: "http://placehold.it/50x50"
    click_button "Create Floorplan"
  end

  describe "Floorplans index" do
    before do
      create_location
      create_floorplan
    end

    it "has location floorplans heading" do
      expect(page).to have_content "Clearwater Floorplans"
    end

    it "shows all floorplans" do
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "3 Beds"
    end
  end

  describe "New Floorplan" do
    before do
      create_location
    end

    it "has new floorplan heading" do
      expect(page).to have_content "New Floorplan"
    end

    it "lets me create a new floorplan" do
      create_floorplan
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "1400"
    end
  end

  describe "Edit Floorplan" do
    before do
      create_location
      create_floorplan
      click_link "Edit Location and Floorplans"
    end

    it "has edit floorplan header" do
      expect(page).to have_content "Edit Floorplans"
    end

    it "has form filled in with floorplan data" do
      expect(page).to have_field("floorplan[title]", with: "Cedar Point")
      expect(page).to have_field("floorplan[beds]", with: "3")
    end

    it "can edit a floorplan" do
      fill_in "Title", with: "Mountain Ridge"
      fill_in "Size", with: "1650"
      click_button "Update Floorplan"
      expect(page).to have_content "Mountain Ridge"
      expect(page).to have_content "1650"
    end
  end

  describe "Destory Floorplans" do
    it "can destroy a floorplan" do
      create_location
      create_floorplan
      click_link "Edit Location and Floorplans"
      within(".edit_floorplan") do
        click_link "Destroy"
      end
      expect(page).not_to have_content "Cedar Point"
    end
  end
end
