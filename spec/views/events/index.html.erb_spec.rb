require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :location => "Location",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :ticket_link => "Ticket Link",
        :location_website => "Location Website"
      ),
      stub_model(Event,
        :title => "Title",
        :location => "Location",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :ticket_link => "Ticket Link",
        :location_website => "Location Website"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket Link".to_s, :count => 2
    assert_select "tr>td", :text => "Location Website".to_s, :count => 2
  end
end
