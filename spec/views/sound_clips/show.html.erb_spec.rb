require 'spec_helper'

describe "sound_clips/show" do
  before(:each) do
    @sound_clip = assign(:sound_clip, stub_model(SoundClip,
      :title => "Title",
      :description => "Description",
      :attachment => "Attachment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Attachment/)
  end
end
