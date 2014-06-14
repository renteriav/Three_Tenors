require "spec_helper"

describe SoundClipsController do
  describe "routing" do

    it "routes to #index" do
      get("/sound_clips").should route_to("sound_clips#index")
    end

    it "routes to #new" do
      get("/sound_clips/new").should route_to("sound_clips#new")
    end

    it "routes to #show" do
      get("/sound_clips/1").should route_to("sound_clips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sound_clips/1/edit").should route_to("sound_clips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sound_clips").should route_to("sound_clips#create")
    end

    it "routes to #update" do
      put("/sound_clips/1").should route_to("sound_clips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sound_clips/1").should route_to("sound_clips#destroy", :id => "1")
    end

  end
end
