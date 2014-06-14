require 'spec_helper'

describe "sound_clips/index" do
  before(:each) do
    assign(:sound_clips, [
      stub_model(SoundClip,
        :title => "Title",
        :description => "Description",
        :attachment => "Attachment"
      ),
      stub_model(SoundClip,
        :title => "Title",
        :description => "Description",
        :attachment => "Attachment"
      )
    ])
  end

  it "renders a list of sound_clips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
  end
end
