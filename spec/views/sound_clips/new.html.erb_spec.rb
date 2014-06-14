require 'spec_helper'

describe "sound_clips/new" do
  before(:each) do
    assign(:sound_clip, stub_model(SoundClip,
      :title => "MyString",
      :description => "MyString",
      :attachment => "MyString"
    ).as_new_record)
  end

  it "renders new sound_clip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sound_clips_path, :method => "post" do
      assert_select "input#sound_clip_title", :name => "sound_clip[title]"
      assert_select "input#sound_clip_description", :name => "sound_clip[description]"
      assert_select "input#sound_clip_attachment", :name => "sound_clip[attachment]"
    end
  end
end
