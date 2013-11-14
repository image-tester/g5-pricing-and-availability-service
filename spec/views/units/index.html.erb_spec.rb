require 'spec_helper'

describe "units/index" do
  before(:each) do
    assign(:units, [
      stub_model(Unit,
        :title => "Title",
        :beds => 1,
        :baths => 2,
        :size => 3,
        :price => 4,
        :deposit => 5,
        :floorplan => "Floorplan"
      ),
      stub_model(Unit,
        :title => "Title",
        :beds => 1,
        :baths => 2,
        :size => 3,
        :price => 4,
        :deposit => 5,
        :floorplan => "Floorplan"
      )
    ])
  end

  it "renders a list of units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Floorplan".to_s, :count => 2
  end
end
