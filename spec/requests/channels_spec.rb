require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/channels", type: :request do
  before(:each) do
    # Stub for the callback method triggering RSS worker
    allow_any_instance_of(Channel).to receive(:rss_worker_start).and_return(true)
  end

  # Channel. As you add validations to Channel, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { link: 'https://www.ruby-lang.org/en/feeds/news.rss' }
  }

  let(:invalid_attributes) {
    {link: 'news.rss'}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Channel.create! valid_attributes
      get channels_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_channel_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Channel" do
        expect {
          post channels_url, params: { channel: valid_attributes }
        }.to change(Channel, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Channel" do
        expect {
          post channels_url, params: { channel: invalid_attributes }
        }.to change(Channel, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested channel" do
      channel = Channel.create! valid_attributes
      expect {
        delete channel_url(channel)
      }.to change(Channel, :count).by(-1)
    end

    it "redirects to the channels list" do
      channel = Channel.create! valid_attributes
      delete channel_url(channel)
      expect(response).to redirect_to(channels_url)
    end
  end
end
