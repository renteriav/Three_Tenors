require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :title => "MyString",
      :location => "MyString",
      :address => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :ticket_link => "MyString",
      :location_website => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_location", :name => "event[location]"
      assert_select "input#event_address", :name => "event[address]"
      assert_select "input#event_city", :name => "event[city]"
      assert_select "input#event_zip", :name => "event[zip]"
      assert_select "input#event_ticket_link", :name => "event[ticket_link]"
      assert_select "input#event_location_website", :name => "event[location_website]"
    end
  end
end
