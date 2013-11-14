require 'spec_helper'

describe "units/new" do
  before(:each) do
    assign(:unit, stub_model(Unit,
      :title => "MyString",
      :beds => 1,
      :baths => 1,
      :size => 1,
      :price => 1,
      :deposit => 1,
      :floorplan => "MyString"
    ).as_new_record)
  end

  it "renders new unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", units_path, "post" do
      assert_select "input#unit_title[name=?]", "unit[title]"
      assert_select "input#unit_beds[name=?]", "unit[beds]"
      assert_select "input#unit_baths[name=?]", "unit[baths]"
      assert_select "input#unit_size[name=?]", "unit[size]"
      assert_select "input#unit_price[name=?]", "unit[price]"
      assert_select "input#unit_deposit[name=?]", "unit[deposit]"
      assert_select "input#unit_floorplan[name=?]", "unit[floorplan]"
    end
  end
end
