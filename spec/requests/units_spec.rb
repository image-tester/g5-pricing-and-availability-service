require 'spec_helper'

def create_location
  visit locations_path
  click_link "New Location"
  fill_in "Name", with: "Clearwater"
  fill_in "Urn", with: "g5-cl-8cz7tip-clearwater"
  click_button "Create Location"
end

def create_unit
  click_link "Create New Unit"
  fill_in "Title", with: "Cedar Point"
  fill_in "Available now", with: "2"
  fill_in "Available soon", with: "1"
  fill_in "Beds", with: "3"
  fill_in "Baths", with: "2"
  fill_in "Size", with: "1400"
  fill_in "Price", with: "1600"
  fill_in "Deposit", with: "0"
  fill_in "Floorplan", with: "http://placehold.it/50x50"
  click_button "Create Unit"
end

describe "Units" do

  describe "Units index" do
    before do
      create_location
      create_unit
    end

    it "has location units heading" do
      expect(page).to have_content "Clearwater Units"
    end

    it "shows all units" do
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "3 Beds"
    end
  end

  describe "New Unit" do
    before do
      create_location
    end

    it "has new unit heading" do
      expect(page).to have_content "New Unit"
    end

    it "lets me create a new unit" do
      create_unit
      expect(page).to have_content "Cedar Point"
      expect(page).to have_content "1400"
    end
  end

  describe "Edit Unit" do
    before do
      create_location
      create_unit
      click_link "Edit Location and Units"
    end

    it "has edit unit header" do
      expect(page).to have_content "Edit Units"
    end

    it "has form filled in with unit data" do
      expect(page).to have_field("unit[title]", with: "Cedar Point")
      expect(page).to have_field("unit[beds]", with: "3")
    end

    it "can edit a unit" do
      fill_in "Title", with: "Mountain Ridge"
      fill_in "Size", with: "1650"
      click_button "Update Unit"
      expect(page).to have_content "Mountain Ridge"
      expect(page).to have_content "1650"
    end
  end

  describe "Destory Units" do
    it "can destroy a unit" do
      create_location
      create_unit
      click_link "Edit Location and Units"
      within(".edit_unit") do
        click_link "Destroy"
      end
      expect(page).not_to have_content "Cedar Point"
    end
  end
end
