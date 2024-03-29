require 'rails_helper'

RSpec.describe "Items", type: :request do
  before(:each) do
    # Stub callback method
    allow_any_instance_of(Channel).to receive(:rss_worker_start).and_return(true)

    FactoryBot.create(:item)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/items/1"
      expect(response).to have_http_status(:success)
    end
  end
end
