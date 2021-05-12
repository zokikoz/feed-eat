require 'rails_helper'
require 'sidekiq/testing'
require 'webmock/rspec'

Sidekiq::Testing.inline!

RSpec.describe RssWorker, type: :worker do
  before(:each) do
    rss_response_file = File.new("#{::Rails.root}/tmp/rss_response.txt")
    stub_request(:get, "https://www.ruby-lang.org/en/feeds/news.rss")
      .to_return(status: 200, body: rss_response_file, headers: {})

    # Stub for callback method
    allow_any_instance_of(Channel).to receive(:rss_worker_start).and_return(true)

    Channel.delete_all
    Channel.create!(link: 'https://www.ruby-lang.org/en/feeds/news.rss')
  end
  it "is load entries to items table" do
    Item.delete_all
    expect { RssWorker.perform_async }.to change { Item.count }.from(0)
  end
end
