require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "Title",
      :location => "Location",
      :address => "Address",
      :city => "City",
      :zip => "Zip",
      :ticket_link => "Ticket Link",
      :location_website => "Location Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Location/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/Zip/)
    rendered.should match(/Ticket Link/)
    rendered.should match(/Location Website/)
  end
end
