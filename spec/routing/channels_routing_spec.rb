require "rails_helper"

RSpec.describe ChannelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/channels").to route_to("channels#index")
    end

    it "routes to #new" do
      expect(get: "/channels/new").to route_to("channels#new")
    end

    it "routes to #create" do
      expect(post: "/channels").to route_to("channels#create")
    end

    it "routes to #destroy" do
      expect(delete: "/channels/1").to route_to("channels#destroy", id: "1")
    end
  end
end
