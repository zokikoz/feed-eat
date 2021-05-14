require 'rails_helper'
require 'sidekiq/testing'
require 'webmock/rspec'

Sidekiq::Testing.inline!

RSpec.describe RssWorker, type: :worker do
  before(:each) do
    FactoryBot.create(:channel)
  end
  it "is load entries to items table" do
    expect { RssWorker.perform_async }.to change { Item.count }.by(10)
  end
end
