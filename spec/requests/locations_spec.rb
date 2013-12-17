require 'spec_helper'

describe "Locations" do
  
  def create_location
    fill_in "Name", with: "Clearwater"
    fill_in "Urn", with: "g5-cl-8cz7tip-clearwater"
    click_button "Create Location"
  end
  
  describe "Locations index" do
    before do
      visit locations_path
    end

    it "has locations heading" do
      expect(page).to have_content "Locations"
    end

    it "shows all locations" do
      click_link "New Location"
      create_location
      click_link "Pricing and Availability"
      expect(page).to have_content "Clearwater"
      expect(page).to have_content "g5-cl-8cz7tip-clearwater"
    end
  end

  describe "New Location" do
    before do
      visit new_location_path
    end

    it "has new location heading" do
      expect(page).to have_content "New Location"
    end

    it "lets me create a new location" do
      create_location
      expect(page).to have_content "Clearwater Floor Plans"
    end
  end

  describe "Edit Locations" do
    before do
      visit new_location_path
      create_location
      click_link "Edit Location and Floor Plans"
    end

    it "has edit location heading" do
      expect(page).to have_content "Edit Location"
    end

    it "has form filled in with location data" do
      expect(page).to have_field("location[name]", with: "Clearwater")
      expect(page).to have_field("location[urn]", with: "g5-cl-8cz7tip-clearwater")
    end

    it "can edit a location" do
      fill_in "Name", with: "Tampa"
      fill_in "Urn", with: "g5-cl-8cz7tip-tampa"
      click_button "Update Location"
      click_link "Pricing and Availability"
      expect(page).to have_content "Tampa"
      expect(page).to have_content "g5-cl-8cz7tip-tampa"
    end
  end

  describe "Destroy Locations" do
    it "can destroy a location" do
      visit new_location_path
      create_location
      click_link "Pricing and Availability"
      click_link "Destroy"
      expect(page).not_to have_content "Clearwater"
    end
  end
end



