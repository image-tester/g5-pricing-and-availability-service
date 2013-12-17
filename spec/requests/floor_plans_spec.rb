require 'spec_helper'

describe "Floor Plans" do
  
  def create_location
    visit locations_path
    click_link "New Location"
    fill_in "location_name", with: "Clearwater"
    fill_in "Urn", with: "g5-cl-8cz7tip-clearwater"
    click_button "Create Location"
  end

  def create_floor_plan
    click_link "Create New Floor Plan"
    fill_in "Title", with: "Cedar Point"
    fill_in "Available now", with: "2"
    fill_in "Available soon", with: "1"
    fill_in "Beds", with: "3"
    fill_in "Baths", with: "2"
    fill_in "Size", with: "1400"
    fill_in "Price", with: "1600"
    fill_in "Deposit", with: "0"
    fill_in "Floorplan", with: "http://placehold.it/50x50"
    click_button "Create Floor plan"
  end

  describe "Floor plans index" do
    before do
      create_location
      create_floor_plan
    end

    it "has location floor plans heading" do
      expect(page).to have_content "Clearwater Floor Plans"
    end

    it "shows all floor plans" do
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "3 Beds"
    end
  end

  describe "New Floor Plan" do
    before do
      create_location
    end

    it "has new floor plan heading" do
      expect(page).to have_content "New Floor Plan"
    end

    it "lets me create a new floor plan" do
      create_floor_plan
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "1400"
    end
  end

  describe "Edit Floor Plan" do
    before do
      create_location
      create_floor_plan
      click_link "Edit Location and Floor Plans"
    end

    it "has edit floor plan header" do
      expect(page).to have_content "Edit Floor Plans"
    end

    it "has form filled in with floor plan data" do
      expect(page).to have_field("floor_plan[title]", with: "Cedar Point")
      expect(page).to have_field("floor_plan[beds]", with: "3")
    end

    it "can edit a floor plan" do
      fill_in "Title", with: "Mountain Ridge"
      fill_in "Size", with: "1650"
      click_button "Update Floor plan"
      expect(page).to have_content "Mountain Ridge"
      expect(page).to have_content "1650"
    end
  end

  describe "Destory Floor Plans" do
    it "can destroy a floor plan" do
      create_location
      create_floor_plan
      click_link "Edit Location and Floor Plans"
      within(".edit_floor_plan") do
        click_link "Destroy"
      end
      expect(page).not_to have_content "Cedar Point"
    end
  end
end
